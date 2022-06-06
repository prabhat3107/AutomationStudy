output "user_arns" {
  value = module.users[*].user_arn
  description = "The ARNS of the created IAM users"
}