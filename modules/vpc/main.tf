provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Subnet Pública
resource "aws_subnet" "public" {
  count                  = var.subnet_count
  vpc_id                 = aws_vpc.main.id
  cidr_block             = element(var.subnet_cidr_blocks, count.index)
  availability_zone      = element(var.availability_zones, count.index)
  map_public_ip_on_launch = count.index == 0 ? true : false
  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

# Subnet Privada
resource "aws_subnet" "private" {
  count                  = var.subnet_count
  vpc_id                 = aws_vpc.main.id
  cidr_block             = element(var.subnet_cidr_blocks, count.index + var.subnet_count) # Adicionando var.subnet_count para garantir que seja uma faixa de CIDR diferente
  availability_zone      = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false # Configurando para false, já que é uma subnet privada
  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}