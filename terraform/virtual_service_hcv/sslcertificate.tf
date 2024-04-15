resource "avi_sslkeyandcertificate" "certificate_tf_vs" {
  name      = "${var.vs_name}-certificate"
  type      = "SSL_CERTIFICATE_TYPE_VIRTUALSERVICE"
  key_params {
    algorithm = "SSL_KEY_ALGORITHM_EC"
    ec_params {
      curve = "SSL_KEY_EC_CURVE_SECP256R1"
    }
  }
  certificate_management_profile_ref = data.avi_certificatemanagementprofile.vault_cmp.id
  certificate {
    self_signed = false
    subject {
      common_name = var.vs_fqdn
      country = "GB"
      organization = "VMware"
    }
    subject_alt_names = [ var.vs_fqdn ]
  }
  lifecycle {
    ignore_changes = [
      certificate
    ]
  }
}