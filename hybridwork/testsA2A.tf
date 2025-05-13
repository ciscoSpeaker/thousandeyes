resource "thousandeyes_agent_to_agent" "Dallas_video_webex" {
  test_name      = "Dallas.video.webex"
  alerts_enabled = false
  interval = 3600
  direction = "bidirectional"
  protocol = "tcp"
  target_agent_id = "5"
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Chicago_video_webex" {
  test_name      = "Chicago.video.webex"
  alerts_enabled = false
  interval = 3600
  direction = "bidirectional"
  protocol = "tcp"
  target_agent_id = "5"
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Chicago_SIP_webex" {
  test_name      = "Chicago.SIP.webex"
  alerts_enabled = false
  interval = 3600
  direction = "bidirectional"
  protocol = "tcp"
  target_agent_id = "5"
  agents = [
    1423278,
    69
  ]
}

resource "thousandeyes_agent_to_agent" "Dallas_SIP_webex" {
  test_name      = "Dallas_SIP_webex"
  alerts_enabled = false
  interval = 3600
  direction = "bidirectional"
  protocol = "tcp"
  target_agent_id = "5"
  agents = [
    1423278,
    69
  ]
}
