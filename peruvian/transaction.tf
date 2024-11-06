locals {
  transaction = csvdecode(file("${path.module}/transaction.csv"))
  }

resource "thousandeyes_web_transaction" "transaction" {
  for_each = tomap({ for inst in local.transaction : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval  = var.test_transaction_interval
  alerts_enabled = var.alerts
  enabled = var.test_enabled
  url = each.value.test_url
  transaction_script = file("${path.module}/${each.value.transaction_js}")
  # bgp_measurements = var.bgp
  # use_public_bgp = var.bgp
  target_time = var.target_time
  time_limit = var.time_limit
  user_agent = var.user_agent
  dynamic "agents" {
    for_each = local.agentsTransaction_name_id
    content  {
    agent_id   = agents.value
    }
  }
}
