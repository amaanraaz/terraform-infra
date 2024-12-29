output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}
output "public_subnet-1-id" {
  description = "public subnet ID"
  value       = module.networking.public_subnet-1
}

output "public_subnet-2-id" {
  description = "public subnet ID"
  value       = module.networking.public_subnet-2
}

output "private_subnet-1-id" {
  description = "private subnet ID"
  value       = module.networking.private_subnet-1
}

output "private_subnet-2-id" {
  description = "public subnet ID"
  value       = module.networking.private_subnet-2
}

output "Internet-Gateway-id" {
  description = "igw id"
  value       = module.networking.internet-gateway
}

output "public_route_table_id" {
  description = "public rt id"
  value       = module.networking.public_route_table
}

output "private_route_table_id" {
  description = "private rt id"
  value       = module.networking.private_route_table
}

output "public_security_group" {
  description = "public security group id"
  value       = module.security.public_sg_id
}

output "private_security_group" {
  description = "private security group id"
  value       = module.security.private_sg_id
}
