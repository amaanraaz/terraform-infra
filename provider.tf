provider "aws" {
  region = "us-east-1"
  version = "~> 4.0" 
}

terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket = "nginx-bucket-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
