terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_vpc_network" "k8-network" {
    name = "k8-network"
}

resource "yandex_vpc_subnet" "k8-subnet" {
    name = "k8-subnet"
    zone = var.zone
    network_id = yandex_vpc_network.k8-network.id
    v4_cidr_blocks = ["192.168.10.0/24"]
}
