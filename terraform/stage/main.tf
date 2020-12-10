provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

/*terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kit-it"
    region     = "ru-central-1"
    key        = "terraform.tfstate"
    access_key = "bkk4qhdCaGaKOxcsN0ah"
    secret_key = "PJytYlxWrKFV9XxqFv6pISq8haltMCnoHX0Oho19"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}*/

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
