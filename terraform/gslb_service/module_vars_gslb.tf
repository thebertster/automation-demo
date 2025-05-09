variable "gslb_service_name" {
  type        = string
  description = "GSLB Service Name"
  default     = "rc-terraform-demo-gslb"
}

variable "gslb_service_fqdn" {
  type        = string
  description = "GSLB Service FQDN"
  default     = "rc-terraform-demo-gslb.gslb.rc.demo.internal"
}