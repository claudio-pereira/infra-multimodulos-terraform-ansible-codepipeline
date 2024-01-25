provider "aws" {
  region = var.aws_region
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_id

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier           = var.db_instance_identifier
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.security_group_ids[0]]

  skip_final_snapshot = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  tags = {
    Name = "RDS Instance"
  }
}