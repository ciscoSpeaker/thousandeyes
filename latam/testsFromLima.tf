resource "thousandeyes_agent_to_agent" "Lima" {
  for_each = tomap({ for inst in local.agentsFromLima : inst.agent_name => inst })
  test_name =  "Lima to - ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  alerts_enabled = var.alerts
  dynamic "agents" {
    for_each = local.agentLima_id
    content  {
    agent_id   = agents.value
    }
  }
}