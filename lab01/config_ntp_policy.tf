#Get the Organization Moid by Organization Name
data "intersight_organization_organization" "organization_moid" {
  name = var.organization_name
}
output "organization_moid" {
  value = data.intersight_organization_organization.organization_moid.results[0].moid
}
# NTP Policy details
resource "intersight_ntp_policy" "PODX" {
  name        = "${var.organization_name}-ntp-policy"
  description = "NTP policy from Terraform"
  enabled     = true
  ntp_servers = [
    "pool.ntp.org"
  ]
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization_moid.results[0].moid 
  }
}

