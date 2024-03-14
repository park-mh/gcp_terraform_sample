# Create VPC
module "vpc" {
  source                  = "./modules/1_vpc"
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project_id              = var.project_id
  mtu                     = var.mtu
  #description             = var.description
}

# Create Router
module "cloud_router" {
  source          = "./modules/2_router"
  network_path    = local.network_path
  project_id = var.project_id
  region          = var.region
  router_name     = "${local.pre_fix}-rou-internet"

  depends_on = [module.vpc]
}

# Routes
module "cloud_routes" {
  source          = "./modules/3_routes"
  project_id = var.project_id
  network_path    = local.network_path
  routes_name     = "${local.pre_fix}-rou-private-googleapis"
  
  depends_on = [module.cloud_router]
}