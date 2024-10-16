locals {
  transaction = csvdecode(file("${path.module}/transaction.csv"))
  }

resource "thousandeyes_web_transaction" "transaction" {
  for_each = tomap({ for inst in local.transaction : inst.test_resource => inst })
  test_name =  each.value.test_name
  interval  = var.test_transaction_interval
  alerts_enabled = var.alerts
  url = each.value.test_url
  transaction_script = file("${path.module}/${each.value.transaction_js}")
  # bgp_measurements = var.bgp
  # use_public_bgp = var.bgp
  dynamic "agents" {
    for_each = local.agentsTransaction_name_id
    content  {
    agent_id   = agents.value
    }
  }
}