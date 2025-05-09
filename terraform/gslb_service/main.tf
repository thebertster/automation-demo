terraform {
  required_providers {
    avi = {
      source  = "vmware/avi"
      version = "30.2.2"
    }
  }
}

provider "avi" {
  avi_username    = var.gslb_avi_username
  avi_tenant      = var.gslb_avi_tenant
  avi_password    = var.gslb_avi_password
  avi_controller  = var.gslb_avi_controller
  avi_version     = var.gslb_avi_version
  avi_api_timeout = var.avi_api_timeout
}

provider "avi" {
  alias           = "site1"
  avi_username    = var.site1_avi_username
  avi_tenant      = var.site1_avi_tenant
  avi_password    = var.site1_avi_password
  avi_controller  = var.site1_avi_controller
  avi_version     = var.site1_avi_version
  avi_api_timeout = var.avi_api_timeout
}

provider "avi" {
  alias           = "site2"
  avi_username    = var.site2_avi_username
  avi_tenant      = var.site2_avi_tenant
  avi_password    = var.site2_avi_password
  avi_controller  = var.site2_avi_controller
  avi_version     = var.site2_avi_version
  avi_api_timeout = var.avi_api_timeout
}

