variable "aws_region" {
  type        = string
  description = "Região da AWS"
}

variable "public_instance_sg_id" {
  type        = string
  description = "Id do SG do ec2"
}

variable "private_subnet_sg_id" {
  type        = string
  description = "Id do SG do rds"  
}

variable "private_cidr_block" {
  type        = string
  description = "bloco cidr privado"  
}