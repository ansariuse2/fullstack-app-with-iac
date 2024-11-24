module "vpc_module" {
source = "./module/network/vpc"
valoriz_vpc_cidr =var.valoriz_vpc_cidr
}

module "subnet_module" {
source = "./module/network/subnet"
valoriz_vpc_id = module.vpc_module.valoriz_vpc_id
valoriz_subnet_cidr =var.valoriz_subnet_cidr
}

module "route_table" {
  source            = "./module/network/route_table"
  vpc_id            = module.vpc_module.valoriz_vpc_id
  public_subnet_id  = module.subnet_module.valoriz_subnet_id
  igw_id            = module.internet_gateway.igw_id
}


module "internet_gateway" {
  source  = "./module/network/internet_gateway"
  vpc_id  = module.vpc_module.valoriz_vpc_id
}

module "security_group" {
  source         = "./module/network/security_group"
  vpc_id         = module.vpc_module.valoriz_vpc_id
  sg_name        = "valoriz-sg"
  sg_description = "Security group for web access"
}

module "eks" {
  source = "./module/eks"
  subnet_id = module.subnet_module.public_subnet_id
  security_group = module.security_group.security_group_id
  node_role_arn = var.node_role_arn
}
