resource "thousandeyes_agent_to_agent" "Lima" {
  for_each = tomap({ for inst in local.latamAgentsFromLima_name_id : inst.latamAgentFromLimaId => inst })
  test_name =  "Lima to - ${each.value.agent_name}"
  interval  = var.test_interval
  target_agent_id = each.value.latamAgentFromLimaId
  direction = "BIDIRECTIONAL"
  bgp_measurements = var.bgp
  alerts_enabled = var.alerts
  dynamic "agents" {
    for_each = local.latamAgentsLima_name_id
    content  {
    agent_id   = agents.latamAgentLimaId
    }
  }
}