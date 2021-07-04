#____________________________________________________________
#
# Example Intersight Serial over LAN Policy Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "sol_example" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_serial_over_lan"
  description = "Serial over LAN Policy Example."
  name        = "example"
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
}

#______________________________________________
#
# Example with Default Values
#______________________________________________

/*

module "sol_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_serial_over_lan"
  baud_rate   = 9600
  com_port    = "com0"
  description = ""
  enabled     = true
  name        = "sol"
  org_moid    = local.org_moid
  profiles    = []
  ssh_port    = 2400
  tags        = var.tags
}

*/
