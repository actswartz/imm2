#
# Common policies to Standalone/FI-Attached
#

# IP-KVM
resource "intersight_kvm_policy" "kvm_enabled_insecure" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description               = "Terraform deployed"
  name                      = "KVMenabledInsecure"
  enabled                   = true
  maximum_sessions          = 4
  remote_port               = 2069
  enable_video_encryption   = false
  enable_local_server_video = true
}

# IPMI over LAN
resource "intersight_ipmioverlan_policy" "ipmi_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "IPMI over LAN disabled - Terraform deployed"
  name        = "IPMI-Disabled"
  enabled     = false
}

# Serial over LAN
resource "intersight_sol_policy" "sol_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "SOL-Disabled"
  enabled     = false
}

# SNMP
resource "intersight_snmp_policy" "snmp_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "SNMP-Disabled"
  enabled     = false
}

# SYSLOG
resource "intersight_syslog_policy" "local_emergency_remote_notice" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "Local-Emergency-Remote-Notice"

  local_clients {
    min_severity = "emergency"
  }

  remote_clients {
    enabled      = true
    min_severity = "notice"
    hostname     = var.site1_syslog_server
    protocol     = "udp"
    port         = 514
  }

  remote_clients {
    enabled      = false
    min_severity = "notice"
    hostname     = "0.0.0.0"
    protocol     = "udp"
    port         = 514
  }
}

# Boot Order ("precision policy") - /api/v1/boot/PrecisionPolicies
resource "intersight_boot_precision_policy" "local_boot_order" {
  organization {
    moid = local.target_org_moid
  }

  description              = "Boot vDVD and local HDD - Terraform deployed"
  name                     = "Local-Boot-Order"
  configured_boot_mode     = "Legacy"
  enforce_uefi_secure_boot = false

  # This block creates entries in boot/VmediaDevices
  #     https://intersight.com/apidocs/apirefs/boot/VmediaDevices/model/
  boot_devices {
    name        = "RemoteDVD"
    enabled     = true
    object_type = "boot.VirtualMedia"
    class_id    = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "kvm-mapped-dvd"
    })
  }

  boot_devices {
    name        = "LocalHDD"
    enabled     = true
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "HBA"
    })
  }
}

# vMedia - /api/v1/vmedia/Policies
resource "intersight_vmedia_policy" "fedora" {
  organization {
    moid = local.target_org_moid
  }

  name          = "vmedia-fedora"
  description   = "Fedora Install ISO - Terraform Deployed"
  enabled       = false
  encryption    = false
  low_power_usb = false

  mappings {
    authentication_protocol = "none"
    class_id                = "vmedia.Mapping"
    object_type             = "vmedia.Mapping"
    device_type             = "cdd"
    file_location           = "10.60.180.184/Software/Linux/Fedora-Server-dvd-x86_64-35-1.2.iso"
    host_name               = "10.60.180.184"
    mount_options           = "RO"
    mount_protocol          = "nfs"
    password                = ""
    username                = ""
    volume_name             = "FedoraInstall"
  }
}

# Configure BIOS policy
resource "intersight_bios_policy" "vmware_6_7_U3" {
  organization {
    moid = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "ESX-67U3-BIOS"

  # NIC settings
  cdn_enable          = "enabled"
  cdn_support         = "enabled"
  lom_ports_all_state = "enabled"
  lom_port0state      = "Legacy Only"
  lom_port1state      = "Legacy Only"
  lom_port2state      = "Legacy Only"
  lom_port3state      = "Legacy Only"
  onboard10gbit_lom   = "enabled"
  onboard_gbit_lom    = "enabled"
  pci_option_ro_ms    = "enabled"

  # Memory settings
  numa_optimized      = "enabled"
  direct_cache_access = "enabled"

  # CPU Settings
  cpu_energy_performance = "balanced-performance"
  cpu_power_management   = "energy-efficient"
  cpu_performance        = "custom"

  # Intel/Virtualization Settings
  enhanced_intel_speed_step_tech     = "enabled"
  execute_disable_bit                = "enabled"
  intel_hyper_threading_tech         = "enabled"
  intel_speed_select                 = "Base"
  intel_virtualization_technology    = "enabled"
  intel_vt_for_directed_io           = "enabled"
  intel_vtd_coherency_support        = "enabled"
  intel_vtd_pass_through_dma_support = "enabled"
  llc_prefetch                       = "disabled"
  processor_c1e                      = "enabled"
  processor_c3report                 = "enabled"
  processor_c6report                 = "enabled"
  processor_cstate                   = "enabled"
  pstate_coord_type                  = "HW ALL"
  sr_iov                             = "enabled"

  # Miscellaneous
  serial_port_aenable = "enabled"
  snc                 = "disabled"

  # Required to permit idempotency
  memory_size_limit      = "platform-default"
  partial_mirror_percent = "platform-default"
  partial_mirror_value1  = "platform-default"
  partial_mirror_value2  = "platform-default"
  partial_mirror_value3  = "platform-default"
  partial_mirror_value4  = "platform-default"
  patrol_scrub_duration  = "platform-default"
}

#
# Users and Authentication
#

data "intersight_iam_end_point_role" "admin_role" {
  name = "admin"
  type = "IMC"
}

locals {
  admin_role = data.intersight_iam_end_point_role.admin_role.results[0]
}



resource "intersight_iam_end_point_user_policy" "local_user_policy" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Local User Account Policy - Terraform deployed"
  name        = "IAM-Local-User-Policy"

  password_properties {
    enforce_strong_password  = false
    enable_password_expiry   = false
    password_expiry_duration = 90
    password_history         = 5
    notification_period      = 15
    grace_period             = 0
  }
}


#
# FI-Attached Specific Resources
#

# IP Pools
resource "intersight_ippool_pool" "oob_mgmt_ip_pool" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description      = "OOB Management IP Address Pool- Terraform deployed"
  name             = "OOB-Mgmt-IP-Pool"
  assignment_order = "sequential"

  ip_v4_config {
    object_type = "ippool.IpV4Config"
    gateway     = "10.60.1.1"
    netmask     = "255.255.255.0"
    primary_dns = "10.60.180.185"
  }

  ip_v4_blocks {
    object_type = "ippool.IpV4Block"
    from        = "10.60.1.40"
    to          = "10.60.1.49"
  }
}

## UUID Pools
resource "intersight_uuidpool_pool" "intersight_uuid_pool" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description      = "UUID Pools for IMM Servers - Terraform deployed"
  name             = "Intersight-UUID-Pool"
  assignment_order = "sequential"
  prefix           = "12345678-1234-1234"

  uuid_suffix_blocks {
    object_type = "uuidpool.UuidBlock"
    from        = "1234-012345678900"
    to          = "1234-01234567890F"
  }
}

# UCS Access Policy
resource "intersight_access_policy" "oob_mgmt_access" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "OOB Management IP Address Policy - Terraform deployed"
  name        = "OOB-Mgmt-Access"

  configuration_type {
    configure_inband      = false
    configure_out_of_band = true
  }

  out_of_band_ip_pool {
    object_type = "ippool.Pool"
    moid        = intersight_ippool_pool.oob_mgmt_ip_pool.moid
  }
}
