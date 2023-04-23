#____________________________________________________________
#
# Example Intersight Switch Control Policies Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "switch_control_example" {
  source               = "/root/imm2/modules/switch_control_policies"
  description          = "Switch Control Policy Example."
  name                 = "XXX-Switch-Control-Policy"
  mac_aging_option     = "Custom"
  mac_aging_time       = 1200
  udld_recovery_action = "reset"
  vlan_optimization    = true
  org_moid             = local.org_moid
  tags                 = var.tags

}


#______________________________________________
#
# Example with Default Values
#______________________________________________

/*

module "switch_control_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "/root/imm2/modules/switch_control_policies"
  description           = ""
  name                  = "switch_control"
  mac_aging_option      = "Default"
  mac_aging_time        = 120
  udld_message_interval = 15
  udld_recovery_action  = "none"
  vlan_optimization     = false
  org_moid              = local.org_moid
  profiles = []
  tags = var.tags
}

*/
