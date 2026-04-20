provider "thousandeyes" {
  token            = var.te_token
  account_group_id = var.te_aid
  timeout          = var.te_timeout
  api_sdk_logs_enabled = false    # cambiar a true solo para troubleshooting

}