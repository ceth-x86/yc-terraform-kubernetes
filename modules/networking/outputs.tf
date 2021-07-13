output "network_id" {
  value = yandex_vpc_network.k8-network.id
  description = "network id"
}

output "subnet_id" {
  value = yandex_vpc_subnet.k8-subnet.id
  description = "subnet id"
}