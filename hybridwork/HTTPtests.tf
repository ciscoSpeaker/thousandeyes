resource "thousandeyes_http_server" "workday_cisco" {
  test_name         = "workday.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://wd5.myworkday.com/cisco/"
  use_public_bgp    = true
  bgp_measurements  = true
  alert_rules = local.HTTPalerts_id
  agents = local.agents_id
}

resource "thousandeyes_http_server" "salesconnect_cisco" {
  test_name         = "salesconnect.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://salesconnect.cisco.com/sc/s/"
  use_public_bgp    = true
  bgp_measurements  = true 
  alert_rules = local.HTTPalerts_id
  agents = local.agents_id

}

resource "thousandeyes_http_server" "jira_cisco" {
  test_name         = "jira.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco-cx.atlassian.net/"
  use_public_bgp    = true
  bgp_measurements  = true
  alert_rules = local.HTTPalerts_id
  agents = local.agents_id
}

resource "thousandeyes_http_server" "sharepoint_cisco" {
  test_name         = "sharepoint.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.sharepoint.com/_layouts/15/sharepoint.aspx"
  use_public_bgp    = true
  content_regex     =  ""
  desired_status_code = "403"
  bgp_measurements  = true
  alert_rules = local.HTTPalerts_id
  agents = local.agents_id
}


resource "thousandeyes_http_server" "webex_cisco" {
  test_name         = "webex.cisco"
  interval          = 3600
  alerts_enabled    = true
  url               = "https://cisco.webex.com"
  use_public_bgp    = true
  bgp_measurements  = true
  alert_rules = local.HTTPalerts_id
  agents = local.agents_id
}