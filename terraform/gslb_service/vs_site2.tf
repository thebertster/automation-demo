resource "avi_virtualservice" "site2_vs_tf_vs" {
  provider = avi.site2
  cloud_ref = data.avi_cloud.site2_vs_cloud.id
  cloud_type = "CLOUD_VCENTER"
  name      = var.site2_vs_name

  vsvip_ref = avi_vsvip.site2_vsvip_tf_vs.id
  pool_ref = avi_pool.site2_pool_tf_vs.id
  application_profile_ref = data.avi_applicationprofile.site2_system_http_ap.id
  services {
    port = 80
    port_range_end = 80
  }
  services {
    port = 443
    port_range_end = 443
    enable_ssl = true
  }
  ssl_profile_ref = data.avi_sslprofile.site2_standard_sslprofile.id
  ssl_key_and_certificate_refs = [ data.avi_sslkeyandcertificate.site2_wildcard_cert.id ]
}