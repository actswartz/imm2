#____________________________________________________________
#
# Example Intersight Pool Module
# GUI Location: Pools > Create Pool
#____________________________________________________________


#______________________________________________
#
# Example with  IPv4
#______________________________________________

module "ip_pool_XXX" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source           = "/root/imm2/modules/ip_pools"

  assignment_order = "sequential"
  description      = "IP Pool XXX Example."
  name             = "XXX-ip_pool"
  org_moid         = local.org_moid
  tags             = var.tags
  ipv4_blocks = {
    "0" = {
      from = "198.18.2.32"
      size = 32
      # to   = "198.18.2.63"
    }
  }
  ipv4_config = {
    "config" = {
      gateway       = "198.18.2.1"
      netmask       = "255.255.255.0"
      primary_dns   = "198.18.1.10"
      secondary_dns = "198.18.1.11"
    }
  }
}

#______________________________________________
#
# Example with Default Values
#______________________________________________

/*

module "ip_pool_default" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "/root/imm2/modules/ip_pools"
  assignment_order    = "default"
  description         = ""
  name                = "default"
  org_moid            = local.org_moid
  tags                = var.tags
  ipv4_blocks         = {}
  ipv4_config         = {}
  ipv6_blocks         = {}
  ipv6_config         = {}
}

*/
