# Subnets
module "subnets" {
  source          = "./modules/4_subnets"
  project_id = var.project_id
  network_path    = local.network_path

  subnets = var.subnet_data
  secondary_ranges = var.subnet_data_secondary

  depends_on = [module.cloud_routes]
}