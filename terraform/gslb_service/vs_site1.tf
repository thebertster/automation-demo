resource "avi_virtualservice" "site1_vs_tf_vs" {
  provider = avi.site1
  cloud_ref = data.avi_cloud.site1_vs_cloud.id
  cloud_type = "CLOUD_VCENTER"
  name      = var.site1_vs_name

  vsvip_ref = avi_vsvip.site1_vsvip_tf_vs.id
  pool_ref = avi_pool.site1_pool_tf_vs.id
  application_profile_ref = data.avi_applicationprofile.site1_system_http_ap.id
  services {
    port = 80
    port_range_end = 80
  }
  services {
    port = 443
    port_range_end = 443
    enable_ssl = true
  }
  ssl_profile_ref = data.avi_sslprofile.site1_standard_sslprofile.id
  ssl_key_and_certificate_refs = [ data.avi_sslkeyandcertificate.site1_wildcard_cert.id ]
}