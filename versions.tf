# Provider 
provider "google" {
}

# Backend : Remote State Bucket
terraform {
  backend "gcs" {
    bucket = "cz-test-tfstate"
    prefix = "/"
  }
}