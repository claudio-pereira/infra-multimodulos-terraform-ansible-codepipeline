provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./modules/vpc"
  aws_region           = var.aws_region
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  subnet_count         = var.subnet_count
  subnet_cidr_blocks   = var.subnet_cidr_blocks
  availability_zones   = var.availability_zones
}

module "security_groups" {
  source = "./security_groups"
  public_instance_sg_id = var.public_instance_sg_id
  private_subnet_sg_id = var.private_subnet_sg_id
}

module "ec2" {
  source        = "./modules/ec2"
  aws_region           = var.aws_region
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_ids    = module.vpc.public_subnet_ids
}

module "rds" {
  source              = "./modules/rds"
  aws_region          = var.aws_region
  db_instance_identifier = var.db_instance_identifier
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  instance_class      = var.instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  rds_security_group_id   = module.security_groups.private_subnet_sg_id
}
