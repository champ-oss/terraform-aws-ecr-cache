output "registry_id" {
  value       = aws_ecr_repository.this.registry_id
  description = "repository id"
}

output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "URL of first repository created"
}