variable "site1_avi_cloud" {
  type        = string
  description = "(Site 1): Cloud in which to create Virtual Service"
  default     = "Default-Cloud"
}

variable "site1_avi_seg" {
  type        = string
  description = "(Site 1): SE Group in which to create Virtual Service"
  default     = "Default-Group"
}

variable "site1_vs_name" {
  type        = string
  description = "(Site 1): Name to use for Virtual Service and dependent objects"
  default     = "rc-terraform-demo"
}

variable "site1_vip_network" {
  type        = string
  description = "(Site 1): Network Name (PG) for VIP allocation"
}

variable "site1_vip_subnet" {
  type        = string
  description = "(Site 1): IP Subnet for VIP allocation"
}

variable "site1_vip_subnet_masklen" {
  type        = number
  description = "(Site 1): IP Subnet Mask Length for VIP allocation"
}

variable "site1_pool_servers" {
  type        = list
  description = "(Site 1): List of Pool Server Addresses"
}
