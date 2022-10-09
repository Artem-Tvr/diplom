output "internal_ip_address_coberg_ru" {
  value = "${yandex_compute_instance.node01.network_interface.0.ip_address}"
}

output "external_ip_address_coberg_ru" {
  value = "${yandex_compute_instance.node01.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_db_01_coberg_ru" {
  value = "${yandex_compute_instance.node02.network_interface.0.ip_address}"
}

# output "external_ip_address_db_01_coberg_ru" {
#   value = "${yandex_compute_instance.node02.network_interface.0.nat_ip_address}"
# }

output "internal_ip_address_db_02_coberg_ru" {
  value = "${yandex_compute_instance.node03.network_interface.0.ip_address}"
}

# output "external_ip_address_db_02_coberg_ru" {
#   value = "${yandex_compute_instance.node03.network_interface.0.nat_ip_address}"
# }

output "internal_ip_address_app_coberg_ru" {
  value = "${yandex_compute_instance.node04.network_interface.0.ip_address}"
}

# output "external_ip_address_app_coberg_ru" {
#   value = "${yandex_compute_instance.node04.network_interface.0.nat_ip_address}"
# }

output "internal_ip_address_gitlab_coberg_ru" {
  value = "${yandex_compute_instance.node05.network_interface.0.ip_address}"
}

# output "external_ip_address_gitlab_coberg_ru" {
#   value = "${yandex_compute_instance.node05.network_interface.0.nat_ip_address}"
# }

output "internal_ip_address_runner_coberg_ru" {
  value = "${yandex_compute_instance.node06.network_interface.0.ip_address}"
}

# output "external_ip_address_runner_coberg_ru" {
#   value = "${yandex_compute_instance.node06.network_interface.0.nat_ip_address}"
# }

output "internal_ip_address_monitoring_coberg_ru" {
  value = "${yandex_compute_instance.node07.network_interface.0.ip_address}"
}

# output "external_ip_address_monitoring_coberg_ru" {
#   value = "${yandex_compute_instance.node07.network_interface.0.nat_ip_address}"
# }