terraform {
  required_version = ">= 1.0.0"
  
  backend "s3" {
    bucket = "nginx-bucket-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
