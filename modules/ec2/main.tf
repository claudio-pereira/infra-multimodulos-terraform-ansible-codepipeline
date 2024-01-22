provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id
  key_name      = aws_key_pair.key.key_name

  tags = {
    Name = "EC2 Instance"
  }
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}