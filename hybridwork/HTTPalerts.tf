locals {
  HTTPalerts = csvdecode(file("${path.module}/HTTPalerts.csv"))
  HTTPalerts_id  = [for row in local.HTTPalerts : tonumber(row.http_alert_id)]
}

#output "HTTPalerts" {
#  value = local.HTTPalerts_id
#}