#____________________________________________________________
#
# Example Intersight Port Policy Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# Port Policy Examples
#______________________________________________

module "port_policy_example_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]

  source       = "/root/imm2/modules/port_policies"
  description  = "Port Policy Example."
  device_model = "UCS-FI-64108"
  name         = "XXX-Port_Policy_a"
  org_moid     = local.org_moid
  tags         = var.tags
  profiles     = {}
}

module "port_policy_example_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]

  source       = "/root/imm2/modules/port_policies"
  description  = "Port Policy Example."
  device_model = "UCS-FI-64108"
  name         = "XXX-Port_Policy_b"
  org_moid     = local.org_moid
  tags         = var.tags
  profiles     = {}
}


#______________________________________________
#
# Port Mode Examples
#______________________________________________

module "XXX-port_mode_example_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_example_a
  ]
  source           = "/root/imm2/modules/port_modes"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_example_a.moid
  tags             = var.tags
}

module "XXX-port_mode_example_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_example_b
  ]
  source           = "/root/imm2/modules/port_modes"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_example_b.moid
  tags             = var.tags
}





#______________________________________________
#
# Port Policy with Default Values
#______________________________________________

/*

module "port_policy_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source       = "/root/imm2/modules/port_policies"
  description  = ""
  device_model = "UCS-FI-6454"
  name         = "port_policy"
  org_moid     = local.org_moid
  profiles     = var.profiles
  tags         = var.tags
}


#______________________________________________
#
# Port Mode with Default Values
#______________________________________________

module "port_mode_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source           = "/root/imm2/modules/port_mode"
  custom_mode      = FibreChannel
  port_id_end      = 4
  port_id_start    = 1
  port_policy_moid = ""
  slot_id          = 1
  tags             = var.tags
}


#______________________________________________
#
# Server Port with Default Values
#______________________________________________

module "server_port_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source            = "/root/imm2/modules/port_server_ports"
  port_list         = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
  port_list_type    = "list"
  port_policy_moid  = ""
  port_start        = 5
  port_stop         = 18
  slot_id           = 1
  tags              = var.tags
}


#______________________________________________
#
# LAN Uplink Port Channel with Default Values
#______________________________________________

module "lan_uplink_port_channel_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "/root/imm2/modules/port_ethernet_uplink_port_channel"
  breakout_sw_port      = 0
  flow_control_moid     = []
  lan_uplink_pc_id      = 49
  lan_uplink_pc_ports   = [49, 50]
  lan_uplink_speed      = "Auto"
  link_aggregation_moid = []
  link_control_moid     = []
  port_policy_moid      = **no default, required field**
  slot_id               = 1
  tags                  = var.tags
}


#______________________________________________
#
# LAN_Uplink with Default Values
#______________________________________________

module "lan_uplink_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "/root/imm2/modules/port_ethernet_uplink"
  breakout_sw_port      = 0
  fec                   = "Auto"
  flow_control_moid     = []
  lan_uplink_port_list  = [49]
  lan_uplink_speed      = "Auto"
  link_control_moid     = []
  port_policy_moid      = **no default, required field**
  slot_id               = 1
  tags                  = var.tags
}

#______________________________________________
#
# SAN Uplink Port-Channel with Default Values
#______________________________________________

module "san_uplink_port_channel_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "/root/imm2/modules/port_fc_uplink_port_channel"
  breakout_sw_port    = 0
  fill_pattern        = "Idle"
  san_uplink_pc_id    = 1
  san_uplink_pc_ports = [1, 2]
  san_uplink_speed    = "16Gbps"
  port_policy_moid    = **no default, required field**
  slot_id             = 1
  tags                = var.tags
}

#______________________________________________
#
# SAN Uplink with Default Values
#______________________________________________

module "san_uplink_defaults" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "/root/imm2/modules/port_fc_uplink"
  breakout_sw_port      = 0
  fill_pattern          = var.fill_pattern
  san_uplink_port_list  = [1]
  san_uplink_speed      = "16Gbps"
  port_policy_moid      = **no default, required field**
  slot_id               = 1
  vsan_id               = 1
  tags                  = var.tags
}

*/
