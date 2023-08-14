module "gcr-config" {
  source            = "uptycslabs/gcr-onprem-config/google"
  
  gcp_project_id        = "Your GCP Project ID"
  service_account_name  = "uptycs-gcr-integration"

  integration_name   = "A unique name for this integration"
}
