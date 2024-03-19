module "dns" {
  source = "./modules/6_dns"

  dns             = "${local.pre_fix}-private-dns-" # 입력필요
  zone_type       = var.zone_type     # Default "private"
  project_id = var.project_id
  network_url     = local.network_path

  #depends_on = [module.nat]
}