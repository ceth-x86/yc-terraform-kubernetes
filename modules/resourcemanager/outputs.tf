output "service_account_id" {
  value = yandex_iam_service_account.k8-sa.id
  description = "service account id"
}

output "key_id" {
  value = yandex_kms_symmetric_key.k8-key.id
  description = "key id"
}
