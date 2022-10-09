resource "yandex_compute_instance" "node03" {
  name                      = "db02-node03"
  platform_id               = "standard-v1"
  zone                      = "ru-central1-b"
  hostname                  = "db02.coberg.ru"
  allow_stopping_for_update = true

  resources {
    cores         = 4
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "root-node03"
      type        = "network-nvme"
      size        = "15"
    }
  }

  scheduling_policy {
    preemptible = false
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.my-subnet-b.id}"
    nat        = false
    ip_address = "192.168.101.13" 
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}