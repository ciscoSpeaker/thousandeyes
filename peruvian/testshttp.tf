resource "thousandeyes_http_server" "http_thousandeyes_com" {
  test_name =  "app.thousandeyes.com HTTP"
  description    = "by terraform at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = var.alerts
  url = "https://www.thousandeyes.com"
  bgp_measurements = var.bgp
 dynamic "agents" {
    for_each = local.agentId
    content  {
    agent_id   = agents.value
    }
  }
}