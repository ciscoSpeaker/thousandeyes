locals {
  vpnpublic = csvdecode(file("${path.module}/vpnpublic.csv"))
  }

locals {
  vpntunnel = csvdecode(file("${path.module}/vpntunnel.csv"))
  }

#resource "thousandeyes_agent_to_server" "vpn_public" {
#  for_each = tomap({ for inst in local.vpnpublic : inst.vpn_resource => inst })
#  test_name =  each.value.vpn_name
#  server = each.value.vpn_target
#  enabled = var.test_enabled
#  protocol = each.value.protocol
#  port = each.value.port
#  interval  = var.test_vpn_interval
#  alerts_enabled = var.alerts
#  bgp_measurements = var.bgp
#  use_public_bgp = var.bgp
#  #agents = local.agentRPi_id
#  dynamic "agents" {
#    for_each = local.agentRPi_id
#    content  {
#    agent_id   = agents.value
#    }
#  }
#}

#resource "thousandeyes_agent_to_server" "vpn_tunnel" {
#  for_each = tomap({ for inst in local.vpntunnel : inst.vpn_resource => inst })
#  test_name =  each.value.vpn_name
#  server = each.value.vpn_target
#  protocol = each.value.protocol
#  enabled = var.test_enabled
#  port = each.value.port
#  interval  = var.test_vpn_interval
#  alerts_enabled = var.alerts
#  #agents = local.agentRPi_id
#  dynamic "agents" {
#    for_each = local.agentRPi_id
#    content  {
#    agent_id   = agents.value
#    }
#  }
#}