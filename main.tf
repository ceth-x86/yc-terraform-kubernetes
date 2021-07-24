terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}


module "networking" {
  source = "./modules/networking"
  zone = var.zone
}

module "resourcemanager" {
  source = "./modules/resourcemanager"
  folder_id = var.folder_id
}

module "kubernetes" {
  source = "./modules/kubernetes"
  name = var.name
  zone = var.zone
  network_id = module.networking.network_id
  subnet_id = module.networking.subnet_id
  service_account_id = module.resourcemanager.service_account_id
  key_id = module.resourcemanager.key_id
}
