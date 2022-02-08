resource "google_service_account" "ansible_provision_account" {
  account_id   = "ansible-provision"
  display_name = "ansible-provision"
  description  = "ansibleのプロビジョニングで使用するためのサービスアカウント"
}

resource "google_project_iam_member" "ansible_gcp_provisioning_compute_admin" {
  project = var.project
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.ansible_provision_account.email}"
}

# GCE OSログイン用に追加している
resource "google_project_iam_member" "ansible_gcp_provisioning_service_account_user" {
  project = var.project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.ansible_provision_account.email}"
}