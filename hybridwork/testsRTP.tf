resource "thousandeyes_voice" "Chicago_RTP_webex" {
  test_name         = "Chicago.RTP.webex"
  interval          = 3600
  alerts_enabled    = true
  bgp_measurements  = true
  use_public_bgp    = true
  dscp_id           = 46
  duration          = 5
  jitter_buffer     = 40
  num_path_traces   = 3
  randomized_start_time = false
  enabled           = true
  target_agent_id   = 775081
  agents = [
    1423278,
    69,
    55521,
    56490,
    63438, 
    73,
    7,
    98976,
    347326,
    65163, 
    10,
    32, 
    108963
  ]
}

resource "thousandeyes_voice" "Dallas_RTP_webex" {
  test_name         = "Dallas.RTP.webex"
  interval          = 3600
  alerts_enabled    = true
  bgp_measurements  = true
  use_public_bgp    = true
  dscp_id           = 46
  duration          = 5
  jitter_buffer     = 40
  num_path_traces   = 3
  randomized_start_time = false
  enabled           = true
  target_agent_id   = 775091
  agents = [
    1423278,
    69,
    55521,
    56490,
    63438, 
    73,
    7,
    98976,
    347326,
    65163, 
    10,
    32, 
    108963
  ]
}