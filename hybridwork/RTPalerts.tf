locals {
  RTPalerts = csvdecode(file("${path.module}/RTPalerts.csv"))
  RTPalerts_id  = [for row in local.RTPalerts : tonumber(row.rtp_alert_id)]
}

#output "RTPalerts" {
#  value = local.RTPalerts_id
#}