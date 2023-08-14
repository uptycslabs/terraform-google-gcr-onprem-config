# terraform-google-gcr-onprem-config

This module creates the necessary GCP resources to grant uptycs access to artifact registries for registry monitoring.

This terraform module will create the following resources:

- Service account

In addition to these resources, the newly created service account will have the following roles attached to it:
- roles/artifactregistry.reader
- roles/storage.objectViewer

## Prerequisites

- Minimum required version of Terraform -> v0.13
- The user must have `Git` installed on the system that they are using to execute the Terraform script.
  - Instructions on how to install Git here: https://github.com/git-guides/install-git
- The user must also have the `gcloud` CLI installed and authenticated as described in both the [Terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#configuring-the-provider) and [GCP](https://cloud.google.com/sdk/gcloud) documentation.

## Running the Terraform Module

- Create a file with name as `main.tf` and paste the code given below into it.

```hcl
module "gcr-config" {
  source            = "uptycslabs/gcr-onprem-config/google"
  
  gcp_project_id        = "Your GCP Project ID"
  service_account_name  = "uptycs-gcr-integration"
}

output "account_email" {
  value = module.gcr-config.account_email
}

```

## Inputs

| Name                   | Description                                                           | Type     | Required |
| ---------------------  | --------------------------------------------------------------------- | -------- | -------- |
| gcp_project_id         | Role external ID provided by Uptycs. Copy the UUID ID from Uptycs' UI | `string` | Yes      |
| service_account_name   | The name of the GCP service account to use for authentication         | `string` |          |
| service_account_exists | A boolean value indicating whether the service account already exists | `bool`   |          |

## Outputs

| Name          | Description               |
| ------------- | ------------------------- |
| account_email | GCP Service Account Email |

# GCP Authentication

Prior to executing this modiue, ensure that you are locally authenticated to GCP.

```sh
gcloud auth application-default login
```

# Execute Terraform Script to Generate terraform outputs

```sh
$ terraform init -upgrade
$ terraform plan
$ terraform apply
```
