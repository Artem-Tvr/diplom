resource "yandex_compute_instance" "node01" {
  name                      = "proxy-node01"
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"
  hostname                  = "coberg.ru"
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.nat_instance}"
      name        = "root-node01"
      type        = "network-nvme"
      size        = "15"
    }
  }

  scheduling_policy {
    preemptible = false
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my-subnet-a.id}"
    nat        = true
    ipv4       = true
    ip_address = "192.168.100.11"
    nat_ip_address = "62.84.115.226"
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}