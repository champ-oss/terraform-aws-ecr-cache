output "registry_id" {
  value       = var.enabled ? aws_ecr_repository.this[0].registry_id : ""
  description = "repository id"
}

output "repository_url" {
  value       = var.enabled ? aws_ecr_repository.this[0].repository_url : ""
  description = "URL of first repository created"
}