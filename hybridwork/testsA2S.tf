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

resource "thousandeyes_agent_to_server" "Richardson_cisco" {
  test_name      = "Richardson.cisco"
  interval       = 120
  alerts_enabled = false
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "SanJose_cisco" {
  test_name      = "SanJose.cisco"
  interval       = 120
  alerts_enabled = false
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "toparpa_descubre" {
  test_name      = "toparpa.descubre"
  interval       = 120
  alerts_enabled = false
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "cary_descubre" {
  test_name      = "cary.descubre"
  interval       = 120
  alerts_enabled = false
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  agents = [
    1423278,
    69
  ]
}