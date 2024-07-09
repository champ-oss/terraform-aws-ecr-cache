locals {
  tags = {
    cost    = "shared"
    creator = "terraform"
    git     = var.git
  }
}

data "aws_region" "this" {
  count = var.enabled ? 1 : 0
}
data "aws_caller_identity" "this" {
  count = var.enabled ? 1 : 0
}

resource "aws_ecr_repository" "this" {
  count                = var.enabled ? 1 : 0
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  tags                 = merge(local.tags, var.tags)
  force_delete         = var.force_delete

  encryption_configuration {
    encryption_type = var.encryption_type
  }
}

resource "null_resource" "sync_image_to_ecr" {
  count      = var.enabled ? 1 : 0
  depends_on = [aws_ecr_repository.this]

  triggers = {
    ecr_name         = aws_ecr_repository.this[0].name
    sync_source_repo = var.sync_source_repo
    sync_source_tag  = var.sync_source_tag
  }

  provisioner "local-exec" {
    command     = "sh ${path.module}/sync_image_to_ecr.sh"
    interpreter = ["/bin/sh", "-c"]
    environment = {
      RETRIES     = var.sync_retries
      SLEEP       = var.sync_sleep_seconds
      AWS_REGION  = data.aws_region.this[0].name
      SOURCE_REPO = var.sync_source_repo
      IMAGE_TAG   = var.sync_source_tag
      ECR_ACCOUNT = data.aws_caller_identity.this[0].account_id
      ECR_NAME    = aws_ecr_repository.this[0].name
    }
  }
}