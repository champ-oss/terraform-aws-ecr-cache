variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-ecr"
}

variable "name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
}

variable "image_tag_mutability" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  default     = "MUTABLE"
}

variable "encryption_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  default     = "AES256"
}

variable "sync_source_repo" {
  description = "Name of the source docker repo to sync (ex: myaccount/myrepo)"
  type        = string
  default     = ""
}

variable "sync_source_tag" {
  description = "Image tag to sync (ex: v1.0.0)"
  type        = string
  default     = ""
}

variable "sync_retries" {
  description = "How many times to attempt to sync the source docker image tag"
  type        = number
  default     = 60
}

variable "sync_sleep_seconds" {
  description = "Seconds to wait between attempts to sync the source docker image tag"
  type        = number
  default     = 10
}

variable "force_delete" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#force_delete"
  type        = bool
  default     = true
}
