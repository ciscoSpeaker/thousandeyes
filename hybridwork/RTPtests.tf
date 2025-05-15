locals {
  RTPalerts = csvdecode(file("${path.module}/RTPalerts.csv"))
  RTPalerts_id  = [for row in local.RTPalerts : tonumber(row.rtp_alert_id)]
}

locals {
  RTPtests = csvdecode(file("${path.module}/RTPtests.csv"))
}

resource "thousandeyes_voice" "rtp" {
  for_each = tomap({ for inst in local.RTPtests : inst.test_resource => inst })
  test_name         = each.value.test_name
  target_agent_id   = tonumber(each.value.target_agent_id )
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