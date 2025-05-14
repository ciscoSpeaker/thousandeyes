locals {
  A2Salerts = csvdecode(file("${path.module}/A2Salerts.csv"))
  A2Salerts_id  = [for row in local.A2Salerts : tonumber(row.a2s_alert_id)]
}

#output "A2Salerts" {
#  value = local.A2Salerts_id
#}