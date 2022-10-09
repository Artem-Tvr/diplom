resource "yandex_vpc_network" "my-network" {
  name = "my-network"
}

resource "yandex_vpc_route_table" "route" {
  name                 = "route-table"
  network_id           = "${yandex_vpc_network.my-network.id}"
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.100.11"
  }
}

resource "yandex_vpc_subnet" "my-subnet-a" {
  name           = "subnet-a"
  v4_cidr_blocks = ["192.168.100.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.my-network.id}"
  depends_on = [
    yandex_vpc_network.my-network,
  ]
}

resource "yandex_vpc_subnet" "my-subnet-b" {
  name           = "subnet-b"
  v4_cidr_blocks = ["192.168.101.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.my-network.id}"
  route_table_id = "${yandex_vpc_route_table.route.id}"
  depends_on = [
    yandex_vpc_network.my-network,
  ]
}

resource "yandex_dns_zone" "zone1" {
  zone             = "coberg.ru."
  public           = true
}

resource "yandex_dns_recordset" "revproxy" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "coberg.ru."
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}

resource "yandex_dns_recordset" "wordpress" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "www"
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "grafana"
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "prometheus"
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "alertmanager"
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}

resource "yandex_dns_recordset" "gitlab" {
  zone_id = "${yandex_dns_zone.zone1.id}"
  name    = "gitlab"
  type    = "A"
  ttl     = 200
  data    = ["${var.static_ip}"]
}
