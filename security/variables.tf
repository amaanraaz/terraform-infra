variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_sg_name" {
  description = "Name of the public security group"
  type        = string
}

variable "private_sg_name" {
  description = "Name of the private security group"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of allowed IPs for SSH access"
  type        = list(string)
}
