terraform {
  backend "gcs" {}
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

# サービスアカウント
module "iam_service_account" {
  source = "./modules/iam"
  project = var.project
}

# Compute Engine
module "vm" {
  source = "./modules/vm"

  stage   = var.stage
  project = var.project
  zone    = var.zone
}