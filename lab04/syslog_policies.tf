module "syslog" {
  source  = "terraform-cisco-modules/policies-syslog/intersight"
  version = ">= 1.0.1"

  description  = "default Syslog Policy."
  name         = "XXX-Syslog-Policy"
  organization = "default"
  remote_clients = [
    {
      enabled  = true
      hostname = "198.18.1.21"
    },
    {
      enabled  = true
      hostname = "198.18.1.22"
    }
  ]
}
