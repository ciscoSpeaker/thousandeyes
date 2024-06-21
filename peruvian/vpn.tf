locals {
  vpn = csvdecode(file("${path.module}/vpn.csv"))
  }

resource "thousandeyes_agent_to_server" "vpn" {
  for_each = tomap({ for inst in local.vpn : inst.vpn_resource => inst })
  test_name =  each.value.vpn_name
  server = each.value.vpn_target
  protocol = each.value.protocol
  port = each.value.port
  interval  = var.test_vpn_interval
  alerts_enabled = var.alerts
  bgp_measurements = var.bgp
  dynamic "agents" {
    for_each = local.agentId
    content  {
    agent_id   = agents.value
    }
  }
}