# Intersight Provider Information 
terraform {
  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 1.0.22"
    }
  }
}
# Intersight Authentication details
provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint  = var.endpoint
}
