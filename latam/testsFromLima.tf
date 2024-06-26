resource "thousandeyes_agent_to_agent" "Lima" {
  for_each = tomap({ for inst in local.agentsFromLima : inst.agent_name => inst })
  test_name =  "Lima to - ${each.value.agent_name}"
  interval  = var.test_interval
  target_agent_id = each.value.agent_id
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  bgp_measurements = var.bgp
  alerts_enabled = var.alerts
  dynamic "agents" {
    for_each = local.agentsLima
    content  {
    agent_id   = agents.key
    }
  }
}