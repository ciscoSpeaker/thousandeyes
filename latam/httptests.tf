locals {
  httptests = csvdecode(file("${path.module}/httptests.csv"))
  }

#resource "thousandeyes_http_server" "http" {
#  for_each = tomap({ for inst in local.httptests : inst.test_resource => inst })
#  test_name =  each.value.test_name
#  interval       = var.test_http_interval
#  alerts_enabled = var.alerts
#  url = each.value.test_url
##  enabled = var.test_enabled
#  enabled = true
#  # bgp_measurements = var.bgp
#  # use_public_bgp = var.bgp
#  dynamic "agents" {
#    for_each = local.httpagents_id
#    content  {
#    agent_id   = agents.value
#    }
#  }
#}