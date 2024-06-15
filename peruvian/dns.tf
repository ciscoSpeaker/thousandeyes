locals {
  server_dns = csvdecode(file("${path.module}/dns.csv"))
  server_dns_name_id = {for dns in local.server_dns : dns.dns => dns.dns}
  server_dns_name = keys(local.server_dns_name_id)
  server_dns_id = values(local.server_dns_name_id)
}

output "server_dns" {
  value = local.server_dns_name_id
}