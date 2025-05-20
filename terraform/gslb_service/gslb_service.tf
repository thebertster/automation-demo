resource "avi_healthmonitor" "gslb_health_monitor" {
  name = "hm-${var.gslb_service_name}"
  is_federated = true
  type = "HEALTH_MONITOR_HTTPS"
  send_interval = 10
  successful_checks = 2
  failed_checks = 2
  receive_timeout = 4
  monitor_port = 443
  https_monitor {
    http_request = "GET /healthcheck.html HTTP/1.1"
    http_response_code = [ "HTTP_2XX" ]
    http_response = "UP"
    ssl_attributes {
      ssl_profile_ref = data.avi_sslprofile.gslb_standard_sslprofile.id
    }
  }

}

resource "avi_gslbservice" "gslb_service" {
  name = var.gslb_service_name
  enabled = true
  domain_names = [ var.gslb_service_fqdn ]
  groups {
    name = "pool-${var.gslb_service_name}-1"
    priority = 10
    algorithm = "GSLB_ALGORITHM_ROUND_ROBIN"
    members {
      cluster_uuid = data.avi_cluster.site1_cluster.uuid
      vs_uuid = avi_virtualservice.site1_vs_tf_vs.uuid
      ip {
        type = "V4"
        addr = tolist(avi_vsvip.site1_vsvip_tf_vs.vip[0].ip_address)[0].addr
      }
      enabled = true
      ratio = 1
    }
    members {
      cluster_uuid = data.avi_cluster.site2_cluster.uuid
      vs_uuid = avi_virtualservice.site2_vs_tf_vs.uuid
      ip {
        type = "V4"
        addr = tolist(avi_vsvip.site2_vsvip_tf_vs.vip[0].ip_address)[0].addr
      }
      enabled = true
      ratio = 1
    }
  }
  health_monitor_refs = [ avi_healthmonitor.gslb_health_monitor.id ]
  pool_algorithm = "GSLB_SERVICE_ALGORITHM_PRIORITY"
}