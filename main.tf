/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

data "google_service_account" "main_account" {
  count      = var.service_account_exists ? 1 : 0
  account_id = var.service_account_name
  project    = var.gcp_project_id
}

data "google_project" "main_project" {
  project_id = var.gcp_project_id
}

resource "google_service_account" "uptycs_gcr_integration" {
  count        = var.service_account_exists ? 0 : 1
  project      = var.gcp_project_id
  account_id   = var.service_account_name
  display_name = var.service_account_name
  description  = "Uptycs GCR Service Account Intergration"
}

resource "google_project_iam_member" "bind_artifact_registry_reader" {
  role    = "roles/artifactregistry.reader"
  project = var.gcp_project_id
  member  = var.service_account_exists == false ? "serviceAccount:${google_service_account.uptycs_gcr_integration[0].email}" : "serviceAccount:${data.google_service_account.main_account[0].email}"
}

resource "google_project_iam_member" "bind_storage_object_viewer" {
  role    = "roles/storage.objectViewer"
  project = var.gcp_project_id
  member  = var.service_account_exists == false ? "serviceAccount:${google_service_account.uptycs_gcr_integration[0].email}" : "serviceAccount:${data.google_service_account.main_account[0].email}"
}
