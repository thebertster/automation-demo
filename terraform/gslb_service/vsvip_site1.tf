resource "avi_vsvip" "site1_vsvip_tf_vs" {
  provider = avi.site1
  cloud_ref = data.avi_cloud.site1_vs_cloud.id
  name      = "vsvip-${var.site1_vs_name}-${var.site1_avi_cloud}"
  vip {
    auto_allocate_ip          = true
    vip_id                    = "1"
    ipam_network_subnet {
        network_ref = data.avi_network.site1_vs_network.id
        subnet {
            ip_addr {
                addr = var.site1_vip_subnet
                type = "V4"
            }
            mask = var.site1_vip_subnet_masklen
        }
    }
  }
  lifecycle {
    ignore_changes = [ vip[0].discovered_networks ]
  }
}