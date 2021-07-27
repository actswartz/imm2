#____________________________________________________________
#
# Intersight Kubernetes Node OS Configuration Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

resource "intersight_kubernetes_sys_config_policy" "nodeos_config" {
  description     = var.description
  dns_domain_name = var.domain_name
  dns_servers     = var.dns_servers_v4
  name            = var.name
  ntp_servers     = var.ntp_servers
  timezone        = var.timezone
  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
