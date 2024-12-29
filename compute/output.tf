output "public_instance_id" {
  description = "ID of the public instance"
  value       = aws_instance.public.id
}

output "private_instance1_id" {
  description = "ID of the private instance"
  value       = aws_instance.private1.id
}

output "private_instance2_id" {
  description = "ID of the private instance"
  value       = aws_instance.private2.id
}
