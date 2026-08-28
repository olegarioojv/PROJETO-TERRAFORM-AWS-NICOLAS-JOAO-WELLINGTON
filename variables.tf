# Variaveis do projeto terraform-final — prova final (Aula 07),
# valores diferentes dos usados nas Aulas 02-06.

variable "aws_region" {
  description = "Regiao AWS onde os recursos serao criados"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability Zone onde a subnet publica principal sera criada"
  type        = string
  default     = "us-east-1c"
}

variable "availability_zone_b" {
  description = "Segunda Availability Zone, usada pela subnet publica do ALB (precisa ser diferente da AZ principal)"
  type        = string
  default     = "us-east-1d"
}

variable "vpc_cidr" {
  description = "Faixa de IPs (CIDR) da VPC"
  type        = string
  default     = "10.90.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Faixa de IPs (CIDR) da subnet publica principal"
  type        = string
  default     = "10.90.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "Faixa de IPs (CIDR) da segunda subnet publica (AZ2), usada pelo ALB"
  type        = string
  default     = "10.90.3.0/24"
}

variable "private_subnet_cidr" {
  description = "Faixa de IPs (CIDR) da subnet privada, onde o RDS mora"
  type        = string
  default     = "10.90.2.0/24"
}

variable "project_name" {
  description = "Prefixo usado no nome/tags de todos os recursos deste projeto"
  type        = string
  default     = "terraform-final"
}

variable "db_name" {
  description = "Nome do banco de dados (schema) criado dentro da instancia RDS"
  type        = string
  default     = "prova_final"
}

variable "db_username" {
  description = "Usuario administrador do RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha do usuario administrador do RDS (defina em terraform.tfvars, nunca aqui)"
  type        = string
  sensitive   = true
}

variable "frontend_desired_count" {
  description = "Quantidade desejada de tasks do Service frontend"
  type        = number
  default     = 1
}

variable "api_desired_count" {
  description = "Quantidade desejada de tasks do Service api"
  type        = number
  default     = 1
}

variable "frontend_min_capacity" {
  description = "Capacidade minima (numero de tasks) do Auto Scaling do Service frontend"
  type        = number
  default     = 1
}

variable "frontend_max_capacity" {
  description = "Capacidade maxima (numero de tasks) do Auto Scaling do Service frontend"
  type        = number
  default     = 3
}

variable "api_min_capacity" {
  description = "Capacidade minima (numero de tasks) do Auto Scaling do Service api"
  type        = number
  default     = 1
}

variable "api_max_capacity" {
  description = "Capacidade maxima (numero de tasks) do Auto Scaling do Service api"
  type        = number
  default     = 3
}

variable "target_cpu_percent" {
  description = "Utilizacao media de CPU (%) que o Auto Scaling procura manter em cada Service"
  type        = number
  default     = 40
}

variable "target_memory_percent" {
  description = "Utilizacao media de memoria (%) que o Auto Scaling procura manter no Service api"
  type        = number
  default     = 70
}

variable "alert_email" {
  description = "E-mail que recebe as notificacoes do SNS quando um alarme dispara"
  type        = string
}
