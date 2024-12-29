variable "vpc_cidr" {
  type = string
  description = "Vpc cidr range"
}

variable "vpc_name" {
  type        = string
  description = "My VPC created from Terraform"
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "CIDR for my public subnets"
}

variable "public_subnet_name" {
  type = list(string)
  description = "name of my public subnets"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "CIDR for my private subnets"
}

variable "private_subnet_name" {
  type = list(string)
  description = "name of my private subnets"
}

variable "my_tf_ig_name"{
  type = string
  description = "name of my internet gateway"
}

variable "avail_zone" {
  type = list(string)
  description = "availabilty zones"
}
