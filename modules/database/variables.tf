variable "subnet_id" {
  description = "Subnet ID for the RDS instance"
}

variable "subnet_b_id" {
  description = "Subnet B ID for the RDS instance"
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