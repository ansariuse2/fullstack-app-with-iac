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
  source            = "./modules/network/route_table"
  vpc_id            = module.vpc_module.valoriz_vpc_id
  public_subnet_id  = module.subnet_module.valoriz_subnet_id
  igw_id            = module.internet_gateway.igw_id
}


module "internet_gateway" {
  source  = "./modules/network_gateway/internet_gateway"
  vpc_id  = module.vpc_module.valoriz_vpc_id
}


