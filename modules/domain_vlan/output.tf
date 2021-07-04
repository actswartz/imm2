#____________________________________________________________
#
# Collect the moid of the Fabric VLAN as an Output
#____________________________________________________________

output "moid" {
  description = "Fabric VLAN Managed Object ID (moid)."
  value       = intersight_fabric_vlan.vlan.moid
}
