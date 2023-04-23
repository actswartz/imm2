#____________________________________________________________
#
# Example Intersight NTP Policy Module
# GUI Location: Policies > Create Policy > NTP
#____________________________________________________________

module "ntp_example" {

  source       = "/root/imm2/modules/ntp_policies"
  description  = "NTP Policy Example."
  name         = "XXX-NTP-Policy"
  ntp_servers  = ["10.2.2.2","10.3.3.3"]
  org_moid     = local.org_moid

  timezone     = "Etc/GMT"
  tags         = var.tags
  profiles     = {}
}

#______________________________________________
#
# Example with Default Values
#______________________________________________

/*

module "ntp_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                    = "terraform-cisco-modules/imm/intersight//modules/ntp_policies"
  description               = ""
  enabled                   = true
  name                      = "ntp"
  ntp_servers               = var.ntp_servers
  org_moid                  = local.org_moid
  authenticated_ntp_servers = []
  profile_type              = "server"
  profiles                  = var.profiles
  timezone                  = "Etc/GMT"
  tags                      = var.tags
}

*/
