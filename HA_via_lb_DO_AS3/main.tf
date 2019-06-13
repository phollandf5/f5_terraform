provider "bigip" {
  address = "51.140.14.77"
  username = "${var.uname}"
  password = "${var.upassword}"
}

resource "bigip_ltm_irule" "rule2" {
  name = "/Common/terraform_irule2"
  irule = <<EOF
when CLIENT_ACCEPTED {
     log local0. "test"
   }
EOF
}

resource "bigip_ltm_pool" "pool" {
  name = "${var.pool}"
  load_balancing_mode = "round-robin"
  # monitors = ["${bigip_ltm_monitor.monitor.name}","${bigip_ltm_monitor.monitor2.name}"]
  allow_snat = "yes"
  allow_nat = "yes"
}

resource "bigip_ltm_virtual_server" "http" {
  name = "/Common/terraform_vs_http"
  destination = "${var.vip_ip}"
  port = 80
  pool = "${var.pool}"
}

# A Virtual server with SSL enabled
resource "bigip_ltm_virtual_server" "https" {
  name = "/Common/terraform_vs_https"
  destination = "${var.vip_ip}"
  port = 443
  pool = "${var.pool}"
  profiles = ["/Common/tcp","/Common/http"]
  source_address_translation = "automap"
  client_profiles = ["/Common/clientssl"]
  server_profiles = ["/Common/serverssl"]
  translate_address = "enabled"
  translate_port = "enabled"
  # vlans_disabled = true
}

resource "bigip_ltm_node" "node" {
  name = "/Common/terraform_node1"
  address = "10.10.10.10"
  connection_limit = "0"
  dynamic_ratio = "1"
  monitor = "default"
  rate_limit = "disabled"
  fqdn = { address_family = "ipv4", interval = "3000" }
}

resource "bigip_ltm_pool_attachment" "node-terraform_pool" {
  pool = "${var.pool}"
  node = "/Common/terraform_node1:80"
}
