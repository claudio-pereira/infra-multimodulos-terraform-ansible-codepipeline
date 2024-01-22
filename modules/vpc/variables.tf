variable "aws_region" {
  type        = string
  description = "Região da AWS"
}

variable "vpc_name" {
  type        = string
  description = "Nome da VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR Block da VPC"
}

variable "subnet_count" {
  type        = number
  description = "Número de Subnets"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "Lista de CIDR Blocks para Subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de Zonas de Disponibilidade"
}