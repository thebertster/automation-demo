resource "avi_vsvip" "site2_vsvip_tf_vs" {
  provider = avi.site2
  cloud_ref = data.avi_cloud.site2_vs_cloud.id
  name      = "vsvip-${var.site2_vs_name}-${var.site2_avi_cloud}"
  vip {
    auto_allocate_ip          = true
    vip_id                    = "1"
    ipam_network_subnet {
        network_ref = data.avi_network.site2_vs_network.id
        subnet {
            ip_addr {
                addr = var.site2_vip_subnet
                type = "V4"
            }
            mask = var.site2_vip_subnet_masklen
        }
    }
  }
  lifecycle {
    ignore_changes = [ vip[0].discovered_networks ]
  }
}