variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "aws_region" {
  description = "AWS region"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "db_identifier" {
  description = "Identifier for the RDS instance"
}

variable "db_username" {
  description = "Username for the RDS instance"
}

variable "db_password" {
  description = "Password for the RDS instance"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
}

variable "email" {
  description = "Email Alarmas"
}

