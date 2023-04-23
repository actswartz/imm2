#_______________________________________________________________
#
# Example Intersight Network Connectivity Policy Module
# GUI Location: Policies > Create Policy > Network Connectivity
#_______________________________________________________________

module "dns_example_1" {
  source         = "/root/imm2/modules/network_connectivity_policies"
  description    = "Network Connectivity (DNS) Policy Example."
  dns_servers_v4 = ["10.1.1.1"]
  name           = "XXX-Net_Con_Policy"
  org_moid       = local.org_moid

  profiles       = {}
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
  source         = "terraform-cisco-modules/imm/intersight//modules/network_connectivity_policies"
  description    = ""
  dns_servers_v4 = var.dns_servers_v4
  dns_servers_v6 = var.dns_servers_v6
  dynamic_dns    = false
  ipv6_enable    = false
  name           = "dns"
  org_moid       = local.org_moid
  profiles       = []
  tags           = var.tags
  update_domain  = ""
}

*/