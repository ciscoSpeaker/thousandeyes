
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


resource "thousandeyes_http_server" "workday_cisco" {
  test_name         = "workday.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_http_server" "salesconnect_cisco" {
  test_name         = "salesconnect.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_http_server" "jira_cisco" {
  test_name         = "jira.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_http_server" "sharepoint_cisco" {
  test_name         = "sharepoint.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  agents = [
    1423278,
    69
  ]
}


resource "thousandeyes_http_server" "webex_cisco" {
  test_name         = "webex.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  agents = [
    1423278,
    69
  ]
}
