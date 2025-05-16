locals {
  bgpmonitor = csvdecode(file("${path.module}/bgpmonitor.csv"))
  bgpmonitor_id_name = {for bgp in local.bgpmonitor : bgp.monitorId => bgp.monitorName}
  bgpmonitor_id = keys(local.bgpmonitor_id_name)
  bgpmonitor_name = values(local.bgpmonitor_id_name)
}

#output "bgpmonitor_id" {
#  value = local.bgpmonitor_id
#}

#output "bgpmonitor_name" {
#  value = local.bgpmonitor_name
#}