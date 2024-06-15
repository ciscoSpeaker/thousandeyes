locals {
  server_dns = csvdecode(file("${path.module}/dns.csv"))
  server_dns_id_dns = {for dns in local.server_dns : dns.id => dns.dns}
  server_dns_id = keys(local.server_dns_id_dns)
  server_dns_dns = values(local.server_dns_id_dns)
}

output "server_dns" {
  value = local.server_dns_id_dns
}