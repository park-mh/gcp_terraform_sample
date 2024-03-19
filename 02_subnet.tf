# Subnets
module "subnets" {
  source          = "./modules/4_subnets"
  project_id = var.project_id
  network_path    = local.network_path

  subnets = var.subnet_data
  secondary_ranges = var.subnet_data_secondary

  depends_on = [module.cloud_routes]
}

# Nat
module "nat" {
  source          = "./modules/5_nat"
  project_id = var.project_id
  region          = var.region
  router_name     = "${local.pre_fix}-rou-internet"     # 임시 Router Name 수기 입력 > 상위 Cloud Router output 변수로 변경 필요
  #nat_id          = "${local.pre_fix}-host-eip-nat-an3"
  nat_id          = var.nat_id
  nat_ip_id       = var.nat_ip_id
  nat_subnet      = var.nat_subnet
  
  depends_on = [module.subnets]
}