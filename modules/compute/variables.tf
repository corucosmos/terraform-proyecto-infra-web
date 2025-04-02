variable "ami_id" {
  default = "ami-08b5b3a93ed654d19"
  
}
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
}

variable "subnet_b_id" {
  description = "Subnet B ID for the EC2 instances"
}

variable "vpc_id" {
  description = "VPC ID"
}