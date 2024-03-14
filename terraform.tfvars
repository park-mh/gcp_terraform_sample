# Default
project_id   = "mh-test-project-01"
project_name = "cz"
region       = "asia-northeast3"
env          = "test" # test / dev / stg / prd

# VPC
vpc_name                = "cz-test-vpc"
auto_create_subnetworks = "false"
routing_mode            = "REGIONAL"
mtu                     = 1460


# Subnet
subnet_data = [
  {
    subnet_name           = "cz-test-sub-dmz-an3"
    subnet_ip             = "172.21.10.0/26"
    subnet_region         = "asia-northeast3"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
    description           = "DMZ(Gateway) subnet"
  },
  {
    subnet_name           = "cz-test-sub-cli-an3"
    subnet_ip             = "172.21.11.0/24"
    subnet_region         = "asia-northeast3"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
    description           = "cli subnet"
  },
  {
    subnet_name           = "cz-test-sub-service-an3-001"
    subnet_ip             = "172.21.40.0/24"
    subnet_region         = "asia-northeast3"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
    description           = "Service GKE subnet"
  },
  {
    subnet_name           = "cz-test-sub-data-an3-001"
    subnet_ip             = "172.21.60.0/24"
    subnet_region         = "asia-northeast3"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
    description           = "Data Composer subnet"
  }
]

# SubnetMask Secondary Ranges
subnet_data_secondary = {
  sct-d-sub-service-an3-001 = [
    {
      range_name    = "gke-pod"
      ip_cidr_range = "10.160.0.0/18"
    },
    {
      range_name    = "gke-service"
      ip_cidr_range = "10.60.32.0/20"
    }
  ],
  sct-d-sub-data-an3-001 = [
    {
      range_name    = "composer-pod"
      ip_cidr_range = "10.140.0.0/18"
    },
    {
      range_name    = "composer-service"
      ip_cidr_range = "10.40.32.0/20"
    }
  ],
}