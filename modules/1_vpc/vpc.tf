# Variable
variable "vpc_name" {}
variable "auto_create_subnetworks" {}
variable "project_id" {}
variable "routing_mode" {}
variable "mtu" {}
#variable "description" {}

# VPC
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project                 = var.project_id
  mtu                     = var.mtu
  #description = var.description
}