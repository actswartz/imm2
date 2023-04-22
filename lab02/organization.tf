#Get the Organization Moid by Organization Name
data "intersight_organization_organization" "organization_moid" {
  name = var.organization_name
}
output "organization_moid" {
  value = data.intersight_organization_organization.organization_moid.results[0].moid
}
variable "target_organization" {
  description = "Deployment organization for policies - Terraform deployed"
  type        = string
}


# Local vars for easy reference
locals {
  target_org_moid = data.intersight_organization_organization.organization_moid.results[0].moid
  
}
