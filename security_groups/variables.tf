variable "public_instance_sg_id" {
  type        = number
  description = "Id do SG do ec2"
}

variable "private_subnet_sg_id" {
  type        = number
  description = "Id do SG do rds"  
}