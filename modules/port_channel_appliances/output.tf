#_______________________________________________________________
#
# Collect the moid of the Port-Channel - Appliance as an Output
#_______________________________________________________________

output "moid" {
  description = "Port-Channel - Appliance Managed Object ID (moid)."
  value       = { for v in sort(keys(intersight_fabric_appliance_pc_role.port_channel)) : v => intersight_fabric_appliance_pc_role.port_channel[v].moid }
}
