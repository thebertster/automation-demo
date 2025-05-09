data "avi_cloud" "site1_vs_cloud" {
  provider = avi.site1
  name = var.site1_avi_cloud
}

data "avi_healthmonitor" "site1_system_http_hm" {
  provider = avi.site1
  name = "System-HTTP"
}

data "avi_applicationprofile" "site1_system_http_ap" {
  provider = avi.site1
  name = "System-HTTP"
}

data "avi_sslprofile" "site1_standard_sslprofile" {
  provider = avi.site1
  name = "System-Standard-PFS"
}

data "avi_sslkeyandcertificate" "site1_wildcard_cert" {
  provider = avi.site1
  name = "Wildcard-ECDSA-Cert"
}

data "avi_network" "site1_vs_network" {
    provider = avi.site1
    name = var.site1_vip_network
}

data "avi_cluster" "site1_cluster" {
  provider = avi.site1
}