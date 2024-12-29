output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.my-tf-vpc.id
}

output "public_subnet-1" {
  description = "public subnet ID"
  value = aws_subnet.public_subnets[0].id
}

output "public_subnet-2" {
  description = "public subnet ID"
  value = aws_subnet.public_subnets[1].id
}

output "private_subnet-1" {
  description = "private subnet ID"
  value = aws_subnet.private_subnets[0].id
}

output "private_subnet-2" {
  description = "private subnet ID"
  value = aws_subnet.private_subnets[1].id
}

output "internet-gateway" {
  description = "Internet gateway id"
  value = aws_internet_gateway.my-tf-ig.id
}

output "public_route_table" {
  description = "value of public route table id"
  value = aws_route_table.public-route-table.id
}

output "private_route_table" {
  description = "value of private route table id"
  value = aws_route_table.public-route-table.id
}