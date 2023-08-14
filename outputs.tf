/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

output "account_email" {
    description = "Email address for the service account, please update this back on Uptycs' UI"
    value = google_service_account.uptycs_gcr_integration[0].email
}
