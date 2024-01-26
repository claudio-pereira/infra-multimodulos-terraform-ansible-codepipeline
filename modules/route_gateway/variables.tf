variable "aws_region" {
  type        = string
  description = "Região da AWS"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "subnet_id" {
  type        = list(string)
  description = "ID da Subnet Pública"
}