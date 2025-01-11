#vpc 
resource "aws_vpc" "my-tf-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

#public subnet
resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.my-tf-vpc.id
  count = length(var.public_subnet_cidr)
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.avail_zone[count.index]
  tags = {
    Name = var.public_subnet_name[count.index]
  }
}

# Private Subnet
resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.my-tf-vpc.id
  count = length(var.private_subnet_cidr)
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.avail_zone[count.index]
  tags = {
    Name = var.private_subnet_name[count.index]
  }
}

# Internet Gateway

resource "aws_internet_gateway" "my-tf-ig" {
  vpc_id = aws_vpc.my-tf-vpc.id
  tags = {
    Name = var.my_tf_ig_name
  }
}

#public route table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my-tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-tf-ig.id
  }
  tags = {
    Name = "my-public-rt"
  }
}

# public route association
resource "aws_route_table_association" "public-route-association" {
  count = length(var.private_subnet_cidr)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}

# elastic ip for nat gateway
resource "aws_eip" "elastic_ip" {
  tags = {
    Name = "EIP_NAT"
  }
}

resource "aws_nat_gateway" "nat_01" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id = aws_subnet.public_subnets[0].id
  tags = {
    Name = "NAT_GW01"
  }
  depends_on = [ aws_internet_gateway.my-tf-ig ]
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my-tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_01.id
  }
  tags = {
    Name = "my-private-rt"
  }
}

resource "aws_route_table_association" "private-route-association" {
  count = length(var.private_subnet_cidr)
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private-route-table.id
}
