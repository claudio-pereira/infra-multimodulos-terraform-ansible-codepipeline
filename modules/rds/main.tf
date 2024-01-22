provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "rds_instance" {
  identifier           = var.db_instance_identifier
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.rds_security_group_id]

  skip_final_snapshot = true

  tags = {
    Name = "RDS Instance"
  }
}

output "rds_instance_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}