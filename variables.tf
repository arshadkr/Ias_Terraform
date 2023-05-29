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

variable "app_server" {
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
