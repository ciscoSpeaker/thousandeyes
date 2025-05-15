resource "thousandeyes_agent_to_agent" "Cloud" {
  for_each = tomap({ for inst in local.agentsCloudTo : inst.agent_name => inst })
  test_name =  "Latam to ${each.value.agent_name}"
  target_agent_id = each.value.agent_id
  enabled = var.test_enabled
  interval  = var.test_A2A_interval
  direction = var.test_A2A_direction
  protocol = var.test_A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp = var.bgp
  alerts_enabled = var.alerts
  dscp_id = var.dscp
  #alert_rules = local.A2Aalerts_id
  #agents = local.agentCloudFrom_id
  dynamic "agents" {
    for_each = local.agentCloudFrom_id
    content  {
    agent_id   = agents.value
    }
  }
  dynamic "alert_rules" {
    for_each = local.A2Aalerts_id
    content {
      rule_id = alert_rules.value
    }
  }
}
