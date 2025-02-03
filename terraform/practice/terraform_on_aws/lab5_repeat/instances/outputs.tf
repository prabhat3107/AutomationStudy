
output "public_ip" {
   value = "${aws_instance.ec2i_lession_05.public_ip}"
}
output "public_dns" {
  value = "${aws_instance.ec2i_lession_05.public_dns}"
}