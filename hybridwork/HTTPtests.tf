resource "thousandeyes_http_server" "workday_cisco" {
  test_name         = "workday.cisco"
  url               = "https://wd5.myworkday.com/cisco/"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}

resource "thousandeyes_http_server" "salesconnect_cisco" {
  test_name         = "salesconnect.cisco"
  url               = "https://salesconnect.cisco.com/sc/s/"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}

resource "thousandeyes_http_server" "jira_cisco" {
  test_name         = "jira.cisco"
  url               = "https://cisco-cx.atlassian.net/"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}

resource "thousandeyes_http_server" "sharepoint_cisco" {
  test_name         = "sharepoint.cisco"
  url               = "https://cisco.sharepoint.com/_layouts/15/sharepoint.aspx"
  content_regex     =  ""
  desired_status_code = "403"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}

resource "thousandeyes_http_server" "wwwin_cisco" {
  test_name         = "wwwin.cisco"
  url               = "https://wwwin.cisco.com/c/cec/bridge.html/home"
  content_regex     =  ""
  desired_status_code = "200"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}

resource "thousandeyes_http_server" "webex_cisco" {
  test_name         = "webex.cisco"
  url               = "https://cisco.webex.com"
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}