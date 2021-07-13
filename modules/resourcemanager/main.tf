terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_iam_service_account" "k8-sa" {
    name       = "k8-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "viewer" {
  folder_id          = var.folder_id
  role               = "viewer"
  member             = "serviceAccount:${yandex_iam_service_account.k8-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "admin" {
  folder_id          = var.folder_id
  role               = "admin"
  member             = "serviceAccount:${yandex_iam_service_account.k8-sa.id}"
}

resource "yandex_kms_symmetric_key" "k8-key" {
  name              = "k8-key"
  description       = "k8 key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}
