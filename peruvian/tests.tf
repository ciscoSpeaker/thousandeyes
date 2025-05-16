
resource "thousandeyes_http_server" "http" {
  for_each            = tomap({ for inst in local.tests : inst.test_resource => inst })
  test_name           = each.value.test_name
  interval            = var.test_http_interval
  alerts_enabled      = var.alerts
  url                 = each.value.test_url
  enabled             = var.test_enabled
  bgp_measurements    = var.bgp
  #agents = local.agentRPi_id
  dynamic "agents" {
    for_each = local.agentPeru_id
    content  {
    agent_id   = agents.value
    }
  }
  dynamic "alert_rules" {
    for_each = local.HTTPalerts_id
    content {
      rule_id = alert_rules.value
    }
  }
  bgp_monitors {
    monitor_id = 29393
  }
}

resource "thousandeyes_dns_trace" "dns" {
  for_each            = { for test in local.tests : test.test_resource => test }
  test_name           = each.value.test_name
  interval            = var.test_dns_interval
  alerts_enabled      = var.alerts
  domain              = each.value.test_domain
  enabled             = var.test_enabled
  dynamic "agents" {
    for_each = local.agentPeru_id
    content  {
    agent_id   = agents.value
    }
  }
  dynamic "alert_rules" {
    for_each = local.DNSalerts_id
    content {
      rule_id = alert_rules.value
    }
  }
}

#resource "thousandeyes_web_transaction" "transaction" {
#  for_each = tomap({ for inst in local.transaction : inst.test_resource => inst })
#  test_name =  each.value.test_name
#  interval  = var.test_transaction_interval
#  alerts_enabled = var.alerts
#  enabled = var.test_enabled
#  url = each.value.test_url
#  transaction_script = file("${path.module}/${each.value.transaction_js}")
#  # bgp_measurements = var.bgp
#  # use_public_bgp = var.bgp
#  target_time = var.target_time
#  time_limit = var.time_limit
#  user_agent = var.user_agent
#  dynamic "agents" {
#    for_each = local.agentsTransaction_name_id
#    content  {
#    agent_id   = agents.value
#    }
#  }
#}
