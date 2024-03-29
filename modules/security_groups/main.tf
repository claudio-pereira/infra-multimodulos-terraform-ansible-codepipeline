provider "aws" {
  region = var.aws_region
}


resource "aws_security_group" "public_instance_sg" {
  name        = "public-instance-sg"
  description = "Regra de seguranca para instancia EC2 na subnet publica"
  vpc_id                 = var.vpc_id

  ingress {
    from_port   = 22  # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir acesso SSH de qualquer lugar (ajuste conforme necessário)
  }

  ingress {
    from_port   = 80  # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir acesso HTTP de qualquer lugar (ajuste conforme necessário)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permitir todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_security_group" "private_subnet_sg" {
  name        = "private-subnet-sg"
  description = "Regra de seguranca para a subnet privada"
  vpc_id                 = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Bloquear todo o tráfego de entrada por padrão
    cidr_blocks = [var.private_cidr_block[0]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permitir todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}