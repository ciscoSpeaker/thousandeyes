resource "thousandeyes_voice" "Chicago_RTP_webex" {
  test_name         = "Chicago.RTP.webex"
  target_agent_id   = 775081
  duration          = var.voice_duration
  jitter_buffer     = var.voice_jitter_buffer
  num_path_traces   = var.voice_num_path_traces
  randomized_start_time = var.voice_randomized_start_time
  dscp_id           = var.voice_test_dscp_id      
  interval          = var.voice_test_interval       
  bgp_measurements  = var.voice_test_bgp            
  use_public_bgp    = var.voice_test_use_public_bgp 
  enabled           = var.voice_test_enabled      
  alerts_enabled    = var.voice_test_alerts_enabled
  alert_rules = local.RTPalerts_id
  agents = local.agents_id
}

resource "thousandeyes_voice" "Dallas_RTP_webex" {
  test_name         = "Dallas.RTP.webex"
  target_agent_id   = 775091
  duration          = var.voice_duration
  jitter_buffer     = var.voice_jitter_buffer
  num_path_traces   = var.voice_num_path_traces
  randomized_start_time = var.voice_randomized_start_time
  dscp_id           = var.voice_test_dscp_id      
  interval          = var.voice_test_interval       
  bgp_measurements  = var.voice_test_bgp            
  use_public_bgp    = var.voice_test_use_public_bgp 
  enabled           = var.voice_test_enabled      
  alerts_enabled    = var.voice_test_alerts_enabled
  alert_rules       = local.RTPalerts_id
  agents            = local.agents_id
}