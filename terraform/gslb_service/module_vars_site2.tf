variable "site2_avi_cloud" {
  type        = string
  description = "(Site 2): Cloud in which to create Virtual Service"
  default     = "Default-Cloud"
}

variable "site2_avi_seg" {
  type        = string
  description = "(Site 2): SE Group in which to create Virtual Service"
  default     = "Default-Group"
}

variable "site2_vs_name" {
  type        = string
  description = "(Site 2): Name to use for Virtual Service and dependent objects"
  default     = "rc-terraform-demo"
}

variable "site2_vip_network" {
  type        = string
  description = "(Site 2): Network Name (PG) for VIP allocation"
}

variable "site2_vip_subnet" {
  type        = string
  description = "(Site 2): IP Subnet for VIP allocation"
}

variable "site2_vip_subnet_masklen" {
  type        = number
  description = "(Site 2): IP Subnet Mask Length for VIP allocation"
}

variable "site2_pool_servers" {
  type        = list
  description = "(Site 2): List of Pool Server Addresses"
}
