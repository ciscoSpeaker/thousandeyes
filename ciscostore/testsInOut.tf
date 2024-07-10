locals {
  testsInOut = csvdecode(file("${path.module}/testsInOut.csv"))
  }

resource "thousandeyes_http_server" "http_InOut" {
  for_each = tomap({ for inst in local.testsInOut : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval       = var.test_http_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  # bgp_measurements = var.bgp
  # use_public_bgp = var.bgp
  dynamic "agents" {
    for_each = local.enterpriseAgent_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_server" "dns_InOut" {
  for_each = tomap({ for inst in local.testsInOut : inst.test_resource => inst })
  test_name      = each.value.test_name
  interval       = var.test_dns_interval
  alerts_enabled = var.alerts
  domain = each.value.test_domain
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  dynamic "dns_servers" {
    for_each = local.server_dns_name_ip
    content {
      server_name = dns_servers.value
    }
  }
  dynamic "agents" {
    for_each = local.enterpriseAgent_id
    content  {
    agent_id   = agents.value
    }
  }
}
