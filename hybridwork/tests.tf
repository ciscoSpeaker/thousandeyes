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
