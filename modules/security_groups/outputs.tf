# Outputs
output "public_instance_sg_id" {
  value = aws_security_group.public_instance_sg.id
}

output "private_subnet_sg_id" {
  value = aws_security_group.private_subnet_sg.id
}