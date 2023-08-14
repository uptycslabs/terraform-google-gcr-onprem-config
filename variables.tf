/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID where resources will be managed"
}

variable "service_account_exists" {
  type        = bool
  description = "Set to true if service account already exists."
  default     = false
}

variable "service_account_name" {
  type        = string
  description = "The GCP service account name, If a service account with this name already exists, then be sure to set service_account_exists=true"
}
