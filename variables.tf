variable "resource_group_name" {
  type        = string
  description = "RG name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "app_db" {
  type        = string
  description = "App Database"
}

variable "app_server001" {
  type        = string
  description = "App Server001"
}

variable "app_server_firewall_rule" {
  type        = string
  description = "App DB Firewallr"
}

variable "sql_uname" {
  type        = string
  description = "sql username"
}

variable "sql_passwd" {
  type        = string
  description = "sql password"
}

variable "sql_version" {
  type        = string
  description = "version"
}

variable "acr_name" {
  type        = string
  description = "Container Registry"
}

variable "storage_name" {
  type        = string
  description = "Storage_Name"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Container Name"
}

variable "storage_blob_name" {
  type        = string
  description = "Storage Blob Name"
}

variable "cluster_name" {
  type        = string
  description = "AKS name"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes Version"
}

variable "node_count" {
  type        = number
  description = "AKS node count"
}

variable "app_keyvault" {
  type        = string
  description = "Key vault Name"
}

variable "keyvault_name" {
  type        = string
  description = "Key vault for jrcs2"
}

variable "sshkvsecret" {
  type        = string
  description = "kv ssh secret"
}

variable "clientidkvsecret" {
  type        = string
  description = "kv client"
}

variable "spnkvsecret" {
  type        = string
  description = "kv spn secret"
}

variable "aks_vnet_name" {
  type        = string
  description = "aks vnet"
}

variable "vnetcidr" {
  type        = list(any)
  description = "vnetci dir"
}

variable "subnetcidr" {
  type        = list(any)
  description = "subnet dir"
}

variable "dns_name" {
  type        = string
  description = "dns name"
}

variable "agent_pools" {
  type = object({
    name            = string
    count           = number
    vm_size         = string
    os_disk_size_gb = string
    }
  )
}

variable "admin_username" {
  type    = string
}

