locals {
  testshttp = csvdecode(file("${path.module}/testshttp.csv"))
  }

resource "thousandeyes_http_server" "http_" {
  for_each = tomap({ for inst in local.testshttp : inst.test_resource => inst })
  test_name =  each.value.test_name
  description    = "by terraform"
  interval       = var.test_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  bgp_measurements = var.bgp
 dynamic "agents" {
    for_each = local.agentId
    content  {
    agent_id   = agents.value
    }
  }
}