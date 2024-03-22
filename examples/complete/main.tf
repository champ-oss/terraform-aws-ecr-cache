terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Test syncing the latest ubuntu image to ECR
module "this" {
  source           = "../../"
  name             = "terraform-aws-ecr-cache/ubuntu-test"
  sync_source_repo = "ubuntu"
  sync_source_tag  = "latest"
}

# Verify the image and tag exist in ECR
# tflint-ignore: terraform_unused_declarations
data "aws_ecr_image" "this" {
  depends_on      = [module.this]
  repository_name = "terraform-aws-ecr-cache/ubuntu-test"
  image_tag       = "latest"
}