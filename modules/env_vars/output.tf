output "common_tags" {
  value = merge({
    "Environment" = var.environment
    "Team"        = var.team
  }, var.std_tags)
} 