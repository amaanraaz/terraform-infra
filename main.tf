module "networking" {
  source              = "./networking"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_name  = var.public_subnet_name
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_name = var.private_subnet_name
  my_tf_ig_name       = var.my_tf_ig_name
  avail_zone          = var.avail_zone
}

# Security Module
module "security" {
  source          = "./security"
  vpc_id          = module.networking.vpc_id
  public_sg_name  = "public-security-group"
  private_sg_name = "private-security-group"
  allowed_ssh_ips = ["0.0.0.0/0"]
}

# instance
module "compute" {
  source                 = "./compute"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  public_subnet_id       = module.networking.public_subnet-1
  private_subnet1_id     = module.networking.private_subnet-1
  private_subnet2_id     = module.networking.private_subnet-2
  public_sg_id           = module.security.public_sg_id
  private_sg_id          = module.security.private_sg_id
  public_instance_name   = "nginx-tf-public-instance"
  private_instance1_name = "nginx-tf-private-instance1"
  private_instance2_name = "nginx-tf-private-instance2"
  key_pair               = var.key_pair
}

module "ALB" {
  source         = "./ALB"
  security_group = module.security.public_sg_id
  subnets        = [module.networking.public_subnet-1, module.networking.public_subnet-2]
  vpc_id         = module.networking.vpc_id
  target_ids     = [module.compute.private_instance1_id, module.compute.private_instance2_id]
}

module "ASG" {
  source         = "./ASG"
  ami_id         = var.ami_id
  aws_tg_arn     = module.ALB.aws_lb_tg
  subnets        = [module.networking.private_subnet-1, module.networking.private_subnet-2]
  security_group = module.security.public_sg_id
}

module "vpc_peering" {
  source = "./vpc_peering"
  source_vpc_id = module.networking.vpc_id
  target_vpc_id = var.default_vpc_id
  peer_name = "peer_conn"
  source_cidr_block = var.vpc_cidr
  target_cidr_block = var.default_vpc_cidr
  source_route_table_id_public = module.networking.public_route_table
  source_route_table_id_private = module.networking.private_route_table
  target_route_table_id = var.default_route_table_id
}
