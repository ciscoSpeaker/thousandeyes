resource "thousandeyes_agent_to_server" "RTP_cisco" {
  test_name      = "RTP.cisco"
  interval       = 120
  alerts_enabled = false
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}