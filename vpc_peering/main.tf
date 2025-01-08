resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.source_vpc_id
  peer_vpc_id = var.target_vpc_id
  auto_accept = true
  tags = {
    Name = var.peer_name
  }
}

# Route for Source VPC to Target VPC
resource "aws_route" "source_to_target_public" {
  route_table_id         = var.source_route_table_id_public
  destination_cidr_block = var.target_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "source_to_target_private" {
  route_table_id         = var.source_route_table_id_private
  destination_cidr_block = var.target_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Route for Target VPC to Source VPC
resource "aws_route" "target_to_source" {
  route_table_id         = var.target_route_table_id
  destination_cidr_block = var.source_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}