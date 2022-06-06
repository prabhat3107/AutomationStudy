output "first_arn" {

    description = "The ARN of the first user"
    value = aws_iam_user.iam_users[0].arn

  
}

output "all_arns" {

    description = "The ARNs of all Users"

    value = aws_iam_user.iam_users[*].arn
  
}