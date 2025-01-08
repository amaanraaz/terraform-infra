variable "source_vpc_id" {
  description = "The ID of the source VPC (newly created VPC)"
  type        = string
}

variable "target_vpc_id" {
  description = "The ID of the target VPC (default VPC)"
  type        = string
}

variable "peer_name" {
  description = "Tag name for the VPC Peering Connection"
  type        = string
}

variable "source_cidr_block" {
  description = "CIDR block of the source VPC"
  type        = string
}

variable "target_cidr_block" {
  description = "CIDR block of the target VPC"
  type        = string
}

variable "source_route_table_id_public" {
  description = "Route table ID of the source VPC"
  type        = string
}

variable "source_route_table_id_private" {
  description = "Route table ID of the source VPC"
  type        = string
}

variable "target_route_table_id" {
  description = "Route table ID of the target VPC"
  type        = string
}