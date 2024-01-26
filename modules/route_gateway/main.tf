provider "aws" {
  region = var.aws_region
}

resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.main.id
}
