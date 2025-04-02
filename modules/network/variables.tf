variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet A"
  default     = "10.0.1.0/24"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
}