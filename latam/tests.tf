resource "thousandeyes_agent_to_agent" "agent_to_agent_MexicoCity_Lima" {
  test_name      = "MexicoCity-to-Lima"
  interval       = var.test_A2A_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "66222"
  bgp_measurements = var.bgp
  alerts_enabled = var.alerts
  agents {
    agent_id = 63438 
  }
}

resource "thousandeyes_agent_to_agent" "agent_to_agent_MexicoCity_Guadalajara" {
  test_name      = "MexicoCity-to-Guadalajara"
  interval       = var.test_A2A_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "320"
  bgp_measurements = var.bgp
  alerts_enabled = var.alerts
  agents {
    agent_id = 63438 
  }
}