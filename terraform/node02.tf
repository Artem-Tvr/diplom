resource "yandex_compute_instance" "node02" {
  name                      = "db01-node02"
  platform_id               = "standard-v1"
  zone                      = "ru-central1-b"
  hostname                  = "db01.coberg.ru"
  allow_stopping_for_update = true

  resources {
    cores         = 4
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "root-node02"
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
    ip_address = "192.168.101.12"
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}