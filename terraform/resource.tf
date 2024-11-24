module "vpc_module" {
source = "./module/vpc"
valoriz_vpc_cidr =var.valoriz_vpc_cidr
}

module "subnet_module" {
source = "./module/subnet"
valoriz_vpc_id = module.vpc_module.valoriz_vpc_id
valoriz_subnet_cidr =var.valoriz_subnet_cidr
}
