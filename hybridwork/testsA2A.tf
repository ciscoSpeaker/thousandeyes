resource "thousandeyes_agent_to_agent" "Dallas_video_webex" {
  test_name      = "Dallas.video.webex"
  alerts_enabled = true
  interval = 3600
  direction = "to-target"
  protocol = "udp"
  port = 5004
  target_agent_id = "775091"
  dscp_id = 34
  bgp_measurements = true
  use_public_bgp = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Chicago_video_webex" {
  test_name      = "Chicago.video.webex"
  alerts_enabled = true
  interval = 3600
  direction = "to-target"
  protocol = "udp"
  port = 5004
  target_agent_id = "775081"
  dscp_id = 34
  bgp_measurements = true
  use_public_bgp = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Chicago_SIP_webex" {
  test_name      = "Chicago.SIP.webex"
  alerts_enabled = true
  interval = 3600
  direction = "to-target"
  protocol = "tcp"
  port = 5062
  target_agent_id = "775081"
  dscp_id = 34
  bgp_measurements = true
  use_public_bgp = true
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Dallas_SIP_webex" {
  test_name      = "Dallas.SIP.webex"
  alerts_enabled = true
  interval = 3600
  direction = "to-target"
  protocol = "tcp"
  port = 5062
  target_agent_id = "775091"
  dscp_id = 34
  bgp_measurements = true
  use_public_bgp = true
  agents = [
    1423278,
    69
  ]
}
