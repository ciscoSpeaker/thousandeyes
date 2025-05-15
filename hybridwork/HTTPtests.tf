locals {
  HTTPalerts = csvdecode(file("${path.module}/HTTPalerts.csv"))
  HTTPalerts_id  = [for row in local.HTTPalerts : tonumber(row.http_alert_id)]
}

locals {
  HTTPtests = csvdecode(file("${path.module}/HTTPtests.csv"))
}

resource "thousandeyes_http_server" "http" {
  for_each = tomap({ for inst in local.HTTPtests : inst.test_resource => inst })
  test_name            = each.value.test_name
  url                  = each.value.test_url
  content_regex        = each.value.content_regex
  desired_status_code  = tonumber(each.value.desired_status_code)
  interval          = var.http_test_interval  
  use_public_bgp    = var.http_test_use_public_bgp 
  bgp_measurements  = var.http_test_bgp  
  enabled           = var.http_test_enabled
  alerts_enabled    = var.http_test_alerts_enabled 
  alert_rules       = local.HTTPalerts_id
  agents            = local.agents_id
}