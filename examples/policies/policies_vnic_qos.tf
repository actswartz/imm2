#____________________________________________________________
#
# Example Intersight Ethernet vNIC Adapter Policy Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# UCS Server FI-Attached (Domain) Example
#______________________________________________

module "domain_vnic_qos" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = "Recommended Domain Attached vNIC QoS Example."
  name           = "recommended"
  mtu            = 9000
  priority       = "Silver"
  trust_host_cos = false
  org_moid       = local.org_moid
  tags           = var.tags
}


#______________________________________________
#
# UCS Server Standalone Example
#______________________________________________

module "standalone_vnic_qos" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description = "Default Standalone vNIC QoS Example."
  name        = "default_standalone"
  org_moid    = local.org_moid
  tags        = var.tags
}

#______________________________________________
#
# Example(s) with Default Values
#______________________________________________

/*

The Examples Below show the All the Values for the Defualt Configurations

module "vnic_qos_standalone" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description     = ""
  name            = "vnic_qos"
  cos             = 0
  mtu             = 1500
  rate_limit      = 0
  trust_host_cos  = false
  org_moid        = local.org_moid
  tags            = var.tags
}

module "vnic_qos_domain" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description     = ""
  name            = "vnic_qos"
  burst           = 1024
  mtu             = 1500
  priority        = "Best Effort"
  rate_limit      = 0
  trust_host_cos  = false
  org_moid        = local.org_moid
  tags            = var.tags
}

*/
