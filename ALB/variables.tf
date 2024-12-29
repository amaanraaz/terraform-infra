variable "security_group" {
  type = string
  description = "security group of lb"
}

variable "subnets" {
  type = list(string)
  description = "subnets for alb"
}

variable "vpc_id" {
  type = string
  description = "vpc id"
}

variable "target_ids" {
  type = list(string)
  description = "target id's"
}