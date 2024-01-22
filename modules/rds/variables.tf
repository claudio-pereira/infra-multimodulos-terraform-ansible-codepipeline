variable "aws_region" {
  type        = string
  description = "Região da AWS"
}

variable "db_instance_identifier" {
  type        = string
  description = "Identificador da instância RDS"
}

variable "allocated_storage" {
  type        = number
  description = "Espaço de armazenamento alocado para a instância RDS (em GB)"
}

variable "engine" {
  type        = string
  description = "Motor do banco de dados da instância RDS (por exemplo, 'mysql' ou 'postgres')"
}

variable "instance_class" {
  type        = string
  description = "Classe da instância RDS (por exemplo, 'db.t2.micro')"
}

variable "db_name" {
  type        = string
  description = "Nome do banco de dados RDS"
}

variable "db_username" {
  type        = string
  description = "Nome de usuário do banco de dados RDS"
}

variable "db_password" {
  type        = string
  description = "Senha do banco de dados RDS"
}

variable "security_group_id" {
  type        = string
  description = "ID do grupo de segurança VPC associado à instância RDS"
}