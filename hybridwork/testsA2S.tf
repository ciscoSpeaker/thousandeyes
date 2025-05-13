resource "thousandeyes_agent_to_server" "RTP_cisco" {
  test_name      = "RTP.cisco"
  interval       = 3600
  alerts_enabled = true
  server = "rtp-vpn-cluster.cisco.com"
  port   = 443
  bgp_measurements = true
  use_public_bgp = true 
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "Richardson_cisco" {
  test_name      = "Richardson.cisco"
  interval       = 3500
  alerts_enabled = true
  server = "rcdn-vpn-cluster.cisco.com"
  bgp_measurements = true
  port   = 443
  bgp_measurements = true
  use_public_bgp = true 
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "SanJose_cisco" {
  test_name      = "SanJose.cisco"
  interval       = 3600
  alerts_enabled = true
  server = "sjc-vpn-cluster.cisco.com"
  port   = 443
  bgp_measurements = true
  use_public_bgp = true 
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "toparpa_descubre" {
  test_name      = "toparpa.descubre"
  interval       = 3600
  alerts_enabled = true
  server = "toparpa.descubre.app"
  port   = 1194
  bgp_measurements = true
  use_public_bgp = true 
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_server" "cary_descubre" {
  test_name      = "cary.descubre"
  interval       = 3600
  alerts_enabled = true
  server = "cary.descubre.app"
  port   = 1194
  bgp_measurements = true
  use_public_bgp = true 
  agents = [
    1423278,
    69
  ]
}