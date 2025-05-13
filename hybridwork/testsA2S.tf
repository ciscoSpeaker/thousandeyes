resource "thousandeyes_agent_to_server" "RTP_cisco" {
  test_name      = "RTP.cisco"
  interval       = 120
  alerts_enabled = false
  server = "www.thousandeyes.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}