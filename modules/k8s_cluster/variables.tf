
#____________________________________________________________
#
# Kubernetes Cluster Addon Variables Section.
#____________________________________________________________

variable "action" {
  type        = string
  description = "Action for cluster. i.e 'Deploy' 'Unassign'"
  default     = "Unassign"
}

variable "addon_configuration" {
  default     = []
  description = "Addon configuration settings that are specific to a single cluster."
  type        = list(map(string))
}

variable "cert_config" {
  default     = []
  description = "Certificates and keys that are used to configure a Kubernetescluster. If user does not specify any Certificates or Keys,system generated certificates will be used to configure the cluster."
  type        = list(map(string))
}

variable "container_runtime_config" {
  default     = []
  description = "MOID for the Runtime Policy that is being consumed."
  type        = list(map(string))
}

variable "description" {
  default     = ""
  description = "Description for the Profile."
  type        = string
}

variable "ip_pool_moid" {
  description = "MOID derived from the IP Pool that is being consumed."
  type        = string
}

variable "load_balancer" {
  default     = 3
  description = "Number of load balancer addresses to deploy."
  type        = number
}

variable "master_vip" {
  default     = ""
  description = "VIP for the cluster Kubernetes API server. If this is empty and a cluster IP pool is specified, it will be allocated from the IP pool."
  type        = string
}

variable "name" {
  default     = "k8s_cluster"
  description = "Name for the Policy."
  type        = string
}

variable "net_config_moid" {
  description = "MOID for the Network Config Policy that is being consumed."
  type        = string
}

variable "org_moid" {
  description = "Intersight Organization moid."
  type        = string
}

variable "ssh_user" {
  default     = "iksadmin"
  description = "SSH Username for node login."
  type        = string
}
variable "ssh_key" {
  description = "SSH Public Key to be used to node login."
  sensitive   = true
  type        = string
}

variable "sys_config_moid" {
  description = "MOID for the System Config Policy that is being consumed."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}

variable "trusted_registry_moid" {
  type        = string
  description = "MOID for the Trusted Registry Policy that is being consumed."
  default     = ""
}

variable "wait_for_completion" {
  default     = false
  description = "Wait for cluster completion true/false"
  type        = bool
}
