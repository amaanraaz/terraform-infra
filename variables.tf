variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR for vpc"
}

variable "vpc_name" {
  type        = string
  default     = "nginx-vpc"
  description = "My VPC created from Terraform"
}

# variable "public_subnet1_cidr" {
#   type = string
#   default = "10.0.0.0/28"
#   description = "CIDR for my public subnet01"
# }

# variable "public_subnet1_name" {
#   type = string
#   default = "tf-public-subnet-01"
#   description = "name of my public subnet01"
# }
variable "public_subnet_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/28", "10.0.1.0/28"]
  description = "list of cidr's for my public subnets"
}
variable "public_subnet_name" {
  type        = list(string)
  default     = ["nginx-public-subnet-01", "nginx-public-subnet-02"]
  description = "name of my public subnets"
}

# variable "public_subnet2_cidr" {
#   type = string
#   default = "10.0.1.0/28"
#   description = "CIDR for my public subnet01"
# }

# variable "public_subnet2_name" {
#   type = string
#   default = "tf-public-subnet-02"
#   description = "name of my public subnet02"
# }

# variable "private_subnet1_cidr" {
#   type = string
#   default = "10.0.2.0/28"
#   description = "CIDR for my private subnet01"
# }

# variable "private_subnet1_name" {
#   type = string
#   default = "tf-private-subnet-01"
#   description = "name of my private subnet01"
# }

variable "private_subnet_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/28", "10.0.3.0/28"]
  description = "Cidr for my private subnets"
}

variable "private_subnet_name" {
  type        = list(string)
  default     = ["nginx-private-subnet-01", "nginx-private-subnet-02"]
  description = "names of my private subnets"
}

variable "avail_zone" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "availability zones"
}


# variable "private_subnet2_cidr" {
#   type = string
#   default = "10.0.3.0/28"
#   description = "CIDR for my private subnet02"
# }

# variable "private_subnet2_name" {
#   type = string
#   default = "tf-private-subnet-02"
#   description = "name of my private subnet02"
# }


#internet gateway
variable "my_tf_ig_name" {
  type        = string
  default     = "nginx-ig"
  description = "name of internet gateway"
}


# Variables for AMI and instance type
variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
  default     = "ami-07ee04759daf109de"
}

variable "instance_type" {
  description = "Instance type for the instances"
  type        = string
  default     = "t2.micro"
}

#key pair
variable "key_pair" {
  description = "Key pair"
  type        = string
  default     = "ec2"
}
