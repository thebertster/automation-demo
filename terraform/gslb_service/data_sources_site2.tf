data "avi_cloud" "site2_vs_cloud" {
  provider = avi.site2
  name = var.site2_avi_cloud
}

data "avi_healthmonitor" "site2_system_http_hm" {
  provider = avi.site2
  name = "System-HTTP"
}

data "avi_applicationprofile" "site2_system_http_ap" {
  provider = avi.site2
  name = "System-HTTP"
}

data "avi_sslprofile" "site2_standard_sslprofile" {
  provider = avi.site2
  name = "System-Standard-PFS"
}

data "avi_sslkeyandcertificate" "site2_wildcard_cert" {
  provider = avi.site2
  name = "Wildcard-ECDSA-Cert"
}

data "avi_network" "site2_vs_network" {
    provider = avi.site2
    name = var.site2_vip_network
}

data "avi_cluster" "site2_cluster" {
  provider = avi.site2
}