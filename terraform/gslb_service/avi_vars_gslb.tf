variable "gslb_avi_username" {
  type    = string
  description = "Username for API connection to GSLB Leader Avi Controller"
  default = "admin"
}

variable "gslb_avi_password" {
  type    = string
  description = "Password for API connection to GSLB Leader Avi Controller"
  sensitive = true
}

variable "gslb_avi_controller" {
  type    = string
  description = "FQDN or IP Address of GSLB Leader Avi Controller"
}

variable "gslb_avi_version" {
  type    = string
  description = "Avi API Version of GSLB Leader Avi Controller"
  default = "22.1.5"
}

variable "gslb_avi_tenant" {
  type    = string
  description = "Tenant to use for API session on GSLB Leader Avi Controller"
  default = "admin"
}

variable "avi_api_timeout" {
  type    = number
  description = "Timeout for API calls to Avi Controllers"
  default = 20
}