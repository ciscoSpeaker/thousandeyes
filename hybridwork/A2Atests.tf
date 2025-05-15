resource "thousandeyes_agent_to_agent" "Dallas_video_webex" {
  test_name      = "Dallas.video.webex"
  target_agent_id = "775091"
  protocol = "udp"
  port = 5004
  interval = var.a2a_test_interval
  direction = var.a2a_test_direction
  dscp_id = var.a2a_test_dscp_id
  bgp_measurements = var.a2a_test_bgp            
  use_public_bgp = var.a2a_test_use_public_bgp 
  enabled = var.a2a_test_enabled       
  alerts_enabled = var.a2a_test_alerts_enabled
  alert_rules = local.A2Aalerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_agent" "Chicago_video_webex" {
  test_name      = "Chicago.video.webex"
  target_agent_id = "775081"
  protocol = "udp"
  port = 5004
  interval = var.a2a_test_interval
  direction = var.a2a_test_direction
  dscp_id = var.a2a_test_dscp_id
  bgp_measurements = var.a2a_test_bgp            
  use_public_bgp = var.a2a_test_use_public_bgp 
  enabled = var.a2a_test_enabled       
  alerts_enabled = var.a2a_test_alerts_enabled
  alert_rules = local.A2Aalerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_agent" "Chicago_SIP_webex" {
  test_name      = "Chicago.SIP.webex"
  target_agent_id = "775081"
  protocol = "tcp"
  port = 5062
  interval = var.a2a_test_interval
  direction = var.a2a_test_direction
  dscp_id = var.a2a_test_dscp_id
  bgp_measurements = var.a2a_test_bgp            
  use_public_bgp = var.a2a_test_use_public_bgp 
  enabled = var.a2a_test_enabled       
  alerts_enabled = var.a2a_test_alerts_enabled
  alert_rules = local.A2Aalerts_id
  agents = local.agents_id
}

resource "thousandeyes_agent_to_agent" "Dallas_SIP_webex" {
  test_name      = "Dallas.SIP.webex"
  target_agent_id = "775091"
  protocol = "tcp"
  port = 5062
  interval = var.a2a_test_interval
  direction = var.a2a_test_direction
  dscp_id = var.a2a_test_dscp_id
  bgp_measurements = var.a2a_test_bgp            
  use_public_bgp = var.a2a_test_use_public_bgp 
  enabled = var.a2a_test_enabled       
  alerts_enabled = var.a2a_test_alerts_enabled
  alert_rules = local.A2Aalerts_id
  agents = local.agents_id
}