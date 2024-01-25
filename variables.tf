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

variable "public_instance_sg" {
  description = "public_instance_sg"
  default     = "aws_security_group.public_instance_sg"
}

variable "private_subnet_sg" {
  description = "public_instance_sg"
  default     = "aws_security_group.private_instance_sg"
}

variable "public_instance_sg_id" {
  description = "public_instance_sg_id"
  default     = "aws_security_group.public_instance_sg.id"
}

variable "private_subnet_sg_id" {
  description = "public_instance_sg_id"
  default     = "aws_security_group.private_instance_sg.id"
}

# variable "private_cidr_blocks" {
#   description = "private_cidr_block"
#   default     = "module.vpc.aws_subnet.private[0].cidr_block"
# }