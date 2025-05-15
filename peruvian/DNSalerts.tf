locals {
  DNSalerts = csvdecode(file("${path.module}/DNSalerts.csv"))
  DNSalerts_id  = [for row in local.DNSalerts : tonumber(row.dns_alert_id)]
}

#output "DNSalerts" {
#  value = local.DNSalerts_id
#}