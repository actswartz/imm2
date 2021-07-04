#_______________________________________________________________
#
# Example Intersight Network Connectivity (DNS) Policy Module
# GUI Location: Policies > Create Policy
#_______________________________________________________________

module "dns_example_1" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "../../modules/policies_network_connectivity"
  description    = "Network Connectivity (DNS) Policy Example."
  dns_servers_v4 = var.dns_servers_v4
  name           = "example_1"
  org_moid       = local.org_moid
  profile_type   = "domain"
  profiles = [
    data.terraform_remote_state.domain.outputs.domain_profile_a_example.moid,
    data.terraform_remote_state.domain.outputs.domain_profile_b_example.moid
  ]
  tags          = var.tags
  update_domain = "example.com"
}

module "dns_example_2" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "../../modules/policies_network_connectivity"
  description    = "Network Connectivity (DNS) Policy Example with IPv6."
  dns_servers_v4 = var.dns_servers_v4
  dns_servers_v6 = var.dns_servers_v6
  ipv6_enable    = true
  name           = "example_2"
  org_moid       = local.org_moid
  profiles       = []
  tags           = var.tags
  update_domain  = "example.com"
}


#______________________________________________
#
# Example with Default Values
#______________________________________________

/*

module "dns_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  description     = ""
  dns_servers_v4  = var.dns_servers_v4
  dns_servers_v6  = var.dns_servers_v6
  dynamic_dns     = false
  ipv6_enable     = false
  name            = "dns"
  org_moid        = local.org_moid
  profiles        = []
  tags            = var.tags
  update_domain   = ""
}

*/
