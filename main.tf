provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      owner      = "claudio"
      managed-by = "terraform"
    }
  }
}

module "vpc" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  subnet_count       = var.subnet_count
  subnet_cidr_blocks = var.subnet_cidr_blocks
  availability_zones = var.availability_zones
}

module "security_groups" {
  source              = "./modules/security_groups"
  aws_region    = var.aws_region
  public_instance_sg_id = var.public_instance_sg_id
  private_subnet_sg_id = var.private_subnet_sg_id
  private_cidr_block = [module.vpc.private_cidr_blocks[0]]
  vpc_id                 = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  aws_region    = var.aws_region
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  security_group_ids = [module.security_groups.public_instance_sg_id]
  subnet_ids    = [module.vpc.public_subnet_ids]
  vpc_id                 = module.vpc.vpc_id
 }

module "rds" {
  source                 = "./modules/rds"
  aws_region             = var.aws_region
  db_instance_identifier = var.db_instance_identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  instance_class         = var.instance_class
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  security_group_ids = [module.security_groups.private_subnet_sg_id]
  subnet_id              = module.vpc.private_subnet_ids
  
}
