provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "nginx-bucket-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
