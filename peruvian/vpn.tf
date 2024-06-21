locals {
  vpn = csvdecode(file("${path.module}/vpn.csv"))
  }

resource "thousandeyes_agent_to_server" "vpn" {
  for_each = tomap({ for inst in local.vpn : inst.vpn_ip => inst })
  test_name =  each.value.vpn
  interval  = var.test_interval
  server = each.value.vpn
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
