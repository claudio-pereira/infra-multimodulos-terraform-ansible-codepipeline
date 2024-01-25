variable "aws_region" {
  type        = string
  description = "Região da AWS"
}

variable "ami" {
  type        = string
  description = "ID da AMI (Amazon Machine Image)"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2"
}

variable "subnet_ids" {
  type        = list(string)
  description = "IDs das Subnets"
}

variable "key_name" {
  type        = string
  description = "Nome da chave SSH para acesso à instância"
}

variable "security_group_ids" {
  type        = list(string)
  description = "security_group"
}

variable "vpc_id" {
   type = string
    description = "Id da VPC"
}