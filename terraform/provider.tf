# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "bucket-diplom-tf"
    region     = "ru-central1-a"
    key        = "terraform.tfstate"
    access_key = "****************" #key_id
    secret_key = "*****************" #secret

    skip_region_validation      = true
    skip_credentials_validation = true
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone			= "ru-central1-a"
}

