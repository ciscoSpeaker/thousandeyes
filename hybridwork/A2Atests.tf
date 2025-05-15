locals {
  A2Aalerts = csvdecode(file("${path.module}/A2Aalerts.csv"))
  A2Aalerts_id  = [for row in local.A2Aalerts : tonumber(row.a2a_alert_id)]
}

#output "A2Aalerts" {
#  value = local.A2Aalerts_id
#}

locals {
  A2Atests = csvdecode(file("${path.module}/A2Atests.csv"))
}

resource "thousandeyes_agent_to_agent" "a2a" {
  for_each          = tomap({ for inst in local.A2Atests : inst.test_resource => inst })
  test_name         = each.value.test_name  
  target_agent_id   = tonumber(each.value.target_agent_id)
  protocol          = each.value.protocol
  port              = tonumber(each.value.port)
  interval          = var.a2a_test_interval
  direction         = var.a2a_test_direction
  dscp_id           = var.a2a_test_dscp_id
  bgp_measurements  = var.a2a_test_bgp            
  use_public_bgp    = var.a2a_test_use_public_bgp 
  enabled           = var.a2a_test_enabled       
  alerts_enabled    = var.a2a_test_alerts_enabled
  alert_rules       = local.A2Aalerts_id
  agents            = local.agents_id
}