variable "site1_avi_username" {
  type    = string
  description = "Username for API connection to Site 1 Avi Controller"
  default = "admin"
}

variable "site1_avi_password" {
  type    = string
  description = "Password for API connection to Site 1 Avi Controller"
  sensitive = true
}

variable "site1_avi_controller" {
  type    = string
  description = "FQDN or IP Address of Site 1 Avi Controller"
}

variable "site1_avi_version" {
  type    = string
  description = "Avi API Version"
  default = "22.1.5"
}

variable "site1_avi_tenant" {
  type    = string
  description = "Tenant to use for Site 1 API session"
  default = "admin"
}