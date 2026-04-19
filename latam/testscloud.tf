resource "thousandeyes_agent_to_agent" "cloud" {
  for_each = local.agentsCloudTo_map

  test_name        = "latam to ${each.value.agent_name}"
  target_agent_id  = each.value.agent_id
  enabled          = var.test_enabled
  interval         = var.A2A_interval
  direction        = var.A2A_direction
  protocol         = var.A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp   = var.bgp
  alerts_enabled   = var.alerts
  dscp_id          = var.dscp

  dynamic "agents" {
    for_each = toset(local.agentCloudFrom_id)
    content {
      agent_id = agents.value
    }
  }

  dynamic "alert_rules" {
    for_each = toset(var.a2a_alert_rule_ids)
    content {
      rule_id = alert_rules.value
    }
  }

  dynamic "bgp_monitors" {
    for_each = var.bgp ? toset(local.bgpMonitor_ids) : toset([])
    content {
      monitor_id = bgp_monitors.value
    }
  }
}

output "cloud_test_names" {
  value = [
    for t in thousandeyes_agent_to_agent.cloud : t.test_name
  ]
}

output "cloud_test_ids" {
  value = {
    for k, t in thousandeyes_agent_to_agent.cloud : k => t.id
  }
}