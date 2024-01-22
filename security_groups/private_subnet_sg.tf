resource "aws_security_group" "private_subnet_sg" {
  name        = "private-subnet-sg"
  description = "Regra de segurança para a subnet privada"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Bloquear todo o tráfego de entrada por padrão
    cidr_blocks = aws_vpc.main.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permitir todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
}
