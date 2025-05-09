resource "avi_pool" "site1_pool_tf_vs" {
  provider = avi.site1
  cloud_ref = data.avi_cloud.site1_vs_cloud.id
  name      = "${var.site1_vs_name}-pool"
  default_server_port = 80

  dynamic "servers" {
    for_each = var.site1_pool_servers
    content {
      ip {
        addr = servers.value
        type = "V4"
      }
    }
  }

  health_monitor_refs = [ data.avi_healthmonitor.site1_system_http_hm.id ]
  lb_algorithm = "LB_ALGORITHM_LEAST_LOAD"

  # discovered_networks is populated by Cloud Connector and will be seen as a
  # change when set. lifecycle does not allow splat operator still :(
  # May need a Provider-side change to accommodate this better

  lifecycle {
    ignore_changes = [ servers.0.discovered_networks,
                       servers.1.discovered_networks,
                       servers.2.discovered_networks ]
  }
}
