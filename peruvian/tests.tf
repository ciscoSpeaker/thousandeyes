locals {
  tests = csvdecode(file("${path.module}/tests.csv"))
  }

resource "thousandeyes_http_server" "http" {
  for_each = tomap({ for inst in local.tests : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval       = var.test_http_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  bgp_measurements = var.bgp
  dynamic "agents" {
    for_each = local.agentsRPiId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_server" "dns" {
  for_each = tomap({ for inst in local.tests : inst.test_resource => inst })
  test_name      = each.value.test_name
  interval       = var.test_dns_interval
  alerts_enabled = var.alerts
  domain = each.value.test_domain
  dynamic "dns_servers" {
    for_each = local.server_dns_name_ip
    content {
      server_name = dns_servers.value
    }
  }
  dynamic "agents" {
    for_each = local.agentsRPiId
    content  {
    agent_id   = agents.value
    }
  }
}
