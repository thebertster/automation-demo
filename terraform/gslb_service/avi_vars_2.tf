variable "site2_avi_username" {
  type    = string
  description = "Username for API connection to Site 2 Avi Controller"
  default = "admin"
}

variable "site2_avi_password" {
  type    = string
  description = "Password for API connection to Site 2 Avi Controller"
  sensitive = true
}

variable "site2_avi_controller" {
  type    = string
  description = "FQDN or IP Address of Site 2 Avi Controller"
}

variable "site2_avi_version" {
  type    = string
  description = "Avi Site 2 API Version"
  default = "22.1.5"
}

variable "site2_avi_tenant" {
  type    = string
  description = "Tenant to use for Site 2 API session"
  default = "admin"
}