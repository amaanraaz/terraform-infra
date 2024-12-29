# Public Instance
resource "aws_instance" "public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  associate_public_ip_address = true
  key_name = var.key_pair
  security_groups = [
    var.public_sg_id
  ]

  tags = {
    Name = var.public_instance_name
  }
}

# Private Instance
resource "aws_instance" "private1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet1_id
  key_name = var.key_pair
  security_groups = [
    var.public_sg_id
  ]

  tags = {
    Name = var.private_instance1_name
  }
}
resource "aws_instance" "private2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet2_id
  key_name = var.key_pair
  security_groups = [
    var.public_sg_id
  ]

  tags = {
    Name = var.private_instance2_name
  }
}
