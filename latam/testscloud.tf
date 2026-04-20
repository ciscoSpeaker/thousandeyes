resource "thousandeyes_agent_to_agent" "cloud" {
  for_each = local.agentsCloudTo_map

  test_name        = "latam to ${each.value.agent_name}"
  target_agent_id  = tostring(each.value.agent_id)
  enabled          = var.test_enabled
  interval         = var.A2A_interval
  direction        = var.A2A_direction
  protocol         = var.A2A_protocol
  bgp_measurements = var.bgp
  use_public_bgp   = var.use_public_bgp
  alerts_enabled   = var.alerts
  dscp_id          = tostring(var.dscp)

  agents      = toset(local.agentCloudFrom_id)
  alert_rules = var.alerts ? toset(local.A2Aalerts_id) : toset([])
  monitors    = var.bgp ? toset(local.bgpMonitor_ids) : toset([])  # ← nombre correcto v3
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