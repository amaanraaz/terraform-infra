variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID for the public instance"
  type        = string
}

variable "private_subnet1_id" {
  description = "Subnet ID for the private instance"
  type        = string
}
variable "private_subnet2_id" {
  description = "Subnet ID for the private instance"
  type        = string
}

variable "public_sg_id" {
  description = "Security group ID for the public instance"
  type        = string
}

variable "private_sg_id" {
  description = "Security group ID for the private instance"
  type        = string
}

variable "public_instance_name" {
  description = "Name tag for the public instance"
  type        = string
}

variable "private_instance1_name" {
  description = "Name tag for the private instance"
  type        = string
}
variable "private_instance2_name" {
  description = "Name tag for the private instance"
  type        = string
}

variable "key_pair" {
  description = "key pair"
  type = string
}