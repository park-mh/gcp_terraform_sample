variable "project_id" {}
variable "network_path" {}
variable "routes_name" {}

resource "google_compute_route" "googleapis_route" {
  project      = var.project_id
  name         = var.routes_name
  dest_range   = "199.36.153.8/30"
  network      = var.network_path
  next_hop_gateway = "default-internet-gateway"
  priority     = "800"
}