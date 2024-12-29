variable "ami_id" {
  type = string
  description = "value for ami id"
}
variable "aws_tg_arn" {
  type = string
  description = "value"
}
variable "subnets" {
  type = list(string)
  description = "of subnets"
}
variable "security_group" {
  type = string
  description = "value of security group "
}