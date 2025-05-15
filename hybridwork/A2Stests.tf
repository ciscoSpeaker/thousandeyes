locals {
  A2Salerts = csvdecode(file("${path.module}/A2Salerts.csv"))
  A2Salerts_id  = [for row in local.A2Salerts : tonumber(row.a2s_alert_id)]
}

#output "A2Salerts" {
#  value = local.A2Salerts_id
#}

locals {
  A2Stests = csvdecode(file("${path.module}/A2Stests.csv"))
}

resource "thousandeyes_agent_to_server" "a2s" {
  for_each          = tomap({ for inst in local.A2Stests : inst.test_resource => inst })
  test_name         = each.value.test_name  
  server            = each.value.server
  port              = tonumber(each.value.port)
  interval          = var.a2s_test_interval       
  bgp_measurements  = var.a2s_test_bgp 
  use_public_bgp    = var.a2s_test_use_public_bgp 
  enabled           = var.a2s_test_enabled       
  alerts_enabled    = var.a2s_test_alerts_enabled 
  alert_rules       = local.A2Salerts_id
  agents            = local.agents_id
}