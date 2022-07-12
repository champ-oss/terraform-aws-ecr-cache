provider "aws" {
  region = "us-east-1"
}

# Test syncing the latest ubuntu image to ECR
module "this" {
  source           = "../../"
  name             = "terraform-aws-ecr-cache/ubuntu-test"
  sync_source_repo = "ubuntu"
  sync_source_tag  = "latest"
  force_delete     = true
}

# Verify the image and tag exist in ECR
# tflint-ignore: terraform_unused_declarations
data "aws_ecr_image" "this" {
  depends_on      = [module.this]
  repository_name = "terraform-aws-ecr-cache/ubuntu-test"
  image_tag       = "latest"
}