output "public_dns" {
  description = "Public DNS address of the public instance"
  value = aws_instance.aws_example.public_dns
}
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.aws_example.public_ip
}