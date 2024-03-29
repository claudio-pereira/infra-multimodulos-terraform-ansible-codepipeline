provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("./modules/aws-key.pub")
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id[0]
  vpc_security_group_ids = var.security_group_id
  key_name      = aws_key_pair.key.key_name
  

  tags = {
    Name = "EC2 Instance"
  }
  
}