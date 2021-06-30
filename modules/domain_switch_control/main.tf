#____________________________________________________________
#
# Intersight Switch Control Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

resource "intersight_fabric_switch_control_policy" "switch_control" {
  description                    = var.description
  name                           = var.name
  vlan_port_optimization_enabled = var.vlan_optimization
  mac_aging_settings {
    mac_aging_option = var.mac_aging_option
    mac_aging_time   = var.mac_aging_option == "Custom" ? var.mac_aging_time : null
  }
  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }
  udld_settings {
    message_interval = var.udld_message_interval
    recovery_action  = var.udld_recovery_action
  }
  dynamic "profiles" {
    for_each = var.profiles
    content {
      moid        = profiles.value.moid
      object_type = "fabric.SwitchProfile"
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
