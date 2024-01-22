output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "ec2_instance_id" {
  description = "ID da instância EC2 criada"
  value       = module.ec2.ec2_instance_id
}

output "rds_instance_endpoint" {
  description = "Endpoint da instância RDS criada"
  value       = module.rds.rds_instance_endpoint
}
