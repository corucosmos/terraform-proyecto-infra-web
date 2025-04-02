output "vpc_id" {
  description = "ID de la VPC creada."
  value = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID de la subred pública creada."
  value = module.network.public_subnet_id
}

output "db_address" {
  description = "Dirección de la instancia de base de datos RDS."
  value = module.database.db_address
}

output "alb_dns_name" {
  description = "URL pública del ALB"
  value       = module.compute.alb_dns_name
}