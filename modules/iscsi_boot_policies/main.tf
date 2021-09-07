#__________________________________________________________________
#
# Intersight iSCSI Boot Policy
# GUI Location: Policies > Create Policy > iSCSI Boot
#__________________________________________________________________

resource "intersight_vnic_iscsi_boot_policy" "iscsi_boot" {
  auto_targetvendor_name = var.dhcp_vendor_id_iqn
  chap = [
    {
      additional_properties = ""
      class_id              = "vnic.IscsiAuthProfile"
      is_password_set       = var.chap_password != "" ? true : false
      object_type           = "vnic.IscsiAuthProfile"
      password              = var.chap_password
      user_id               = var.chap_user_id
    }
  ]
  description                    = var.description
  initiator_ip_source            = var.initiator_ip_source
  initiator_static_ip_v4_address = var.initiator_static_ip_address
  initiator_static_ip_v4_config = [
    {
      additional_properties = ""
      class_id              = "ippool.IpV4Config"
      gateway               = var.initiator_static_default_gateway
      netmask               = var.initiator_static_subnet_mask
      object_type           = "ippool.IpV4Config"
      primary_dns           = var.initiator_static_primary_dns
      secondary_dns         = var.initiator_static_secondary_dns
    }
  ]
  mutual_chap = [
    {
      additional_properties = ""
      class_id              = "vnic.IscsiAuthProfile"
      is_password_set       = var.chap_password != "" ? true : false
      object_type           = "vnic.IscsiAuthProfile"
      password              = var.mschap_password
      user_id               = var.mschap_user_id
    }
  ]
  name               = var.name
  target_source_type = var.target_source_type
  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }
  dynamic "initiator_ip_pool" {
    for_each = var.initiator_ip_pool
    content {
      moid = initiator_ip_pool.value
    }
  }
  dynamic "iscsi_adapter_policy" {
    for_each = var.iscsi_adapter_policy_moid
    content {
      moid = iscsi_adapter_policy.value
    }
  }
  dynamic "primary_target_policy" {
    for_each = var.primary_target_policy_moid
    content {
      moid = primary_target_policy.value
    }
  }
  dynamic "secondary_target_policy" {
    for_each = var.secondary_target_policy_moid
    content {
      moid = secondary_target_policy.value
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
