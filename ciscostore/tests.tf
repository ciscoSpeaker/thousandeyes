locals {
  testsInOut = csvdecode(file("${path.module}/testsInOut.csv"))
  }

locals {
  testsOutOut = csvdecode(file("${path.module}/testsOutOut.csv"))
  }

resource "thousandeyes_http_server" "http_InOut" {
  for_each = tomap({ for inst in local.testsInOut : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval       = var.test_http_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  # bgp_measurements = var.bgp
  # use_public_bgp = var.bgp
  dynamic "agents" {
    for_each = local.enterpriseAgent_id
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_http_server" "http_OutOut" {
  for_each = tomap({ for inst in local.testsOutOut : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval       = var.test_http_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  # bgp_measurements = var.bgp
  # use_public_bgp = var.bgp
  dynamic "agents" {
    for_each = local.cloudAgent_id
    content  {
    agent_id   = agents.value
    }
  }
}