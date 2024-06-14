resource "thousandeyes_agent_to_agent" "agent_to_agent_MexicoCity_Lima" {
  test_name      = "MexicoCity-to-Lima"
  description    = "by terraform at ${local.now}"
  interval       = var.test_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "66222"
  bgp_measurements = false
  alerts_enabled = false
  agents {
    agent_id = 63438 
  }
}

resource "thousandeyes_agent_to_agent" "agent_to_agent_MexicoCity_Guadalajara" {
  test_name      = "MexicoCity-to-Guadalajara"
  description    = "by terraform at ${local.now}"
  interval       = var.test_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "320"
  bgp_measurements = false
  alerts_enabled = false
  agents {
    agent_id = 63438 
  }
}