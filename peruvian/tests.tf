resource "thousandeyes_http_server" "http" {
  for_each = tomap({ for inst in local.tests : inst.test_resource => inst })
  test_name           = each.value.test_name
  interval            = var.test_http_interval
  alerts_enabled      = var.alerts
  url                 = each.value.test_url
  content_regex       = each.value.content_regex
  desired_status_code = each.value.desired_status_code
  enabled             = var.test_enabled
  bgp_measurements    = var.bgp_measurements
  use_public_bgp      = var.use_public_bgp
  agents              = local.agentPeru_id
  alert_rules         = local.HTTPalerts_id
}

# resource "thousandeyes_web_transaction" "transaction" {
#   for_each = tomap({ for inst in local.transaction : inst.test_resource => inst })
#
#   test_name          = each.value.test_name
#   interval           = var.test_transaction_interval
#   alerts_enabled     = var.alerts
#   enabled            = var.test_enabled
#   url                = each.value.test_url
#   transaction_script = file("${path.module}/${each.value.transaction_js}")
#   target_time        = var.target_time
#   time_limit         = var.time_limit
#   user_agent         = var.user_agent
#   bgp_measurements   = var.bgp
#
#   agents = values(local.agentsTransaction_name_id)
# }
