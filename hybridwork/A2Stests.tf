resource "thousandeyes_agent_to_server" "RTP_cisco" {
  test_name      = "RTP.cisco"
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  interval       = var.a2s_test_interval       
  bgp_measurements = var.a2s_test_bgp 
  use_public_bgp = var.a2s_test_use_public_bgp 
  enabled =  var.a2s_test_enabled       
  alerts_enabled = var.a2s_test_alerts_enabled 
  alert_rules = local.A2Salerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_server" "Richardson_cisco" {
  test_name      = "Richardson.cisco"
  server = "rcdn-vpn-cluster.cisco.com"
  port   = 443
  interval       = var.a2s_test_interval       
  bgp_measurements = var.a2s_test_bgp 
  use_public_bgp = var.a2s_test_use_public_bgp 
  enabled =  var.a2s_test_enabled       
  alerts_enabled = var.a2s_test_alerts_enabled 
  alert_rules = local.A2Salerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_server" "SanJose_cisco" {
  test_name      = "SanJose.cisco"
  server = "sjc-vpn-cluster.cisco.com"
  port   = 443
  interval       = var.a2s_test_interval       
  bgp_measurements = var.a2s_test_bgp 
  use_public_bgp = var.a2s_test_use_public_bgp 
  enabled =  var.a2s_test_enabled       
  alerts_enabled = var.a2s_test_alerts_enabled 
  alert_rules = local.A2Salerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_server" "toparpa_descubre" {
  test_name      = "toparpa.descubre"
  server = "toparpa.descubre.app"
  port   = 1194
  interval       = var.a2s_test_interval       
  bgp_measurements = var.a2s_test_bgp 
  use_public_bgp = var.a2s_test_use_public_bgp 
  enabled =  var.a2s_test_enabled       
  alerts_enabled = var.a2s_test_alerts_enabled 
  alert_rules = local.A2Salerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_server" "cary_descubre" {
  test_name      = "cary.descubre"
  server = "cary.descubre.app"
  port   = 1194
  interval       = var.a2s_test_interval       
  bgp_measurements = var.a2s_test_bgp 
  use_public_bgp = var.a2s_test_use_public_bgp 
  enabled =  var.a2s_test_enabled       
  alerts_enabled = var.a2s_test_alerts_enabled 
  alert_rules = local.A2Salerts_id
  agents = local.agents_id
}