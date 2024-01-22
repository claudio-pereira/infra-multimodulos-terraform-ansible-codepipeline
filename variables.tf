variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for the VPC"
  default     = "example-vpc"
}

variable "subnet_count" {
  description = "Number of Subnets"
  default     = 2
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ami" {
  description = "AMI ID for EC2 Instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  default     = "your-key-pair"
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS Instance"
  default     = "example-rds-instance"
}

variable "allocated_storage" {
  description = "Allocated Storage for RDS Instance"
  default     = 20
}

variable "engine" {
  description = "Database Engine for RDS Instance"
  default     = "postgresql"
}

variable "instance_class" {
  description = "RDS Instance Class"
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "Name of the Database"
  default     = "exampledb"
}

variable "db_username" {
  description = "Username for the Database"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the Database"
  default     = "admin123"
}

variable "rds_security_group_id" {
  description = "Security Group ID for RDS Instance"
  default     = module.security_groups.private_subnet_sg_id
}

variable "ec2_security_group_id" {
  description = "Security Group ID for ec2 Instance"
  default     = module.security_groups.public_subnet_sg_id
}

variable "public_instance_sg_id" {
 default = var.public_instance_sg_id

}

variable "private_subnet_sg_id" {
 default = var.private_subnet_sg_id

}