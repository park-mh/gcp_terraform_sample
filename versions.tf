# Provider 
provider "google" {
  region  = var.region
  version = "~> 4.0"
  project = var.project_id
}

# Backend : Remote State Bucket
terraform {
  backend "gcs" {
    bucket = "cz-test-tfstate"
    prefix = "/"
  }
}