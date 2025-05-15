locals {
  server_dns = csvdecode(file("${path.module}/dns.csv"))
  server_dns_name_ip = {for dns in local.server_dns : dns.name => dns.dns}
  server_dns_name = keys(local.server_dns_name_ip)
  server_dns_ip = values(local.server_dns_name_ip)
}

#output "server_dns" {
#  value = local.server_dns_name_ip
#}