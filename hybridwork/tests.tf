#resource "thousandeyes_agent_to_agent" "example_agent_to_agent_test" {
#  test_name      = "Example Agent to Agent test set from Terraform provider"
#  interval       = 120
#  alerts_enabled = false
#
#  direction = "TO_TARGET"
#  protocol = "TCP"
#  target_agent_id = "5"
#
#  agents {
#    agent_id = 3 # Singapore
#  }
#}

#resource "thousandeyes_agent_to_server" "example_agent_to_server_test" {
#  test_name      = "Example Agent to Server test set from Terraform provider"
#  interval       = 120
#  alerts_enabled = false
#
#  server = "www.thousandeyes.com"
#  port   = 443
#
#  agents {
#    agent_id = 3 # Singapore
#  }
#}

#resource "thousandeyes_http_server" "example_http_server_test" {
#  test_name      = "Example HTTP test set from Terraform provider"
#  interval       = 120
#  alerts_enabled = false
#
#  url = "https://www.thousandeyes.com"
#
#  agents {
#    agent_id = 3 # Singapore
#  }
#}

resource "thousandeyes_voice" "Dallas_RTP_webex" {
  test_name        = "Dallas.RTP.webex"
  interval         = 120
  alerts_enabled   = false
  bgp_measurements = true
  use_public_bgp   = true
  target_agent_id = 364016
  agents = [1423278]
}
