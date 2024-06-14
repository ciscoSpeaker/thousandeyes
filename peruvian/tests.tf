locals {
  tests = csvdecode(file("${path.module}/tests.csv"))
  }

resource "thousandeyes_http_server" "http" {
  for_each = tomap({ for inst in local.tests : inst.test_resource => inst })
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

resource "thousandeyes_dns_trace" "dns" {
  for_each = tomap({ for inst in local.tests : inst.test_resource => inst })
  test_name      = each.value.test_name
  description    = "by terraform"
  interval       = var.test_interval
  alerts_enabled = var.alerts
  domain = each.value.test_url
  dynamic "agents" {
    for_each = local.agentId
    content  {
    agent_id   = agents.value
    }
  }
}