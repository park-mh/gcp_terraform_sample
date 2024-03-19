# Default Variable
variable "project_id" {}
variable "project_name" {}
variable "region" {}

# VPC Variable
variable "vpc_name" {}
variable "auto_create_subnetworks" {}
variable "routing_mode" {}
variable "mtu" {}
#variable "description" {}

# Router Name
variable "router_name" {
  default     = ""
  description = "region of the project."
}

# Routes Name
variable "routes_name" {
  default = ""
}

# Subnet Variable
variable "network_path" {}
variable "subnets" {}
variable "secondary_ranges" {}

# SubnetMask
variable "private_ip_google_access" {
  type    = string
  default = "true"
}

variable "subnet_flow_logs" {
  type    = string
  default = "false"
}

variable "zone_type" {
  type        = string
  description = "Zone Type public , private"
  default     = ""
}

variable "default_subnet_name" {
  type        = string
  description = "Default subnet name - DMZ"
  default     = ""
}

variable "default_subnet_ip" {
  type        = string
  description = "Default subnet IP - DMZ"
  default     = ""
}

variable "subnet_data" { default = "" }
variable "subnet_data_secondary" { default = "" }
variable "nat_id" { default = "" }
variable "nat_ip_id" { default = "" }
variable "nat_subnet" { default = "" }
variable "rules_data" { default = "" }


variable "env" {
  default     = "dev"
  description = "env: dev or stg or prod"
}

variable "division" {
  type        = map(any)
  description = "Name of the project."
  default = {
    test = "t"
    dev = "d"
    stg = "s"
    prd = "p"
  }
}


## Local Variables
locals {
  #project_name = var.project_name
  division     = var.division[var.env]
  pre_fix      = "${var.project_name}-${local.division}" # ex : "scouter-d-"
  network_path = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  #subnet_url   = "projects/${var.host_project_id}/regions/${var.region}/subnetworks"
  firewall = "cz-test-fw-"
}