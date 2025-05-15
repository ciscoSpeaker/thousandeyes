te_timeout = 1000

# HTTP Test
http_test_enabled        = true
http_test_interval       = 3600
http_test_alerts_enabled = true
http_test_bgp            = true
http_test_use_public_bgp = true

# Voice Test
voice_test_enabled        = true
voice_test_interval       = 3600
voice_test_alerts_enabled = true
voice_test_bgp            = true
voice_test_use_public_bgp = true
voice_test_dscp_id        = 46
voice_duration            = 5
voice_jitter_buffer       = 40
voice_num_path_traces     = 3
voice_randomized_start_time = false

# Agent-to-Server Test
a2s_test_enabled        = true
a2s_test_interval       = 3600
a2s_test_alerts_enabled = true
a2s_test_bgp            = true
a2s_test_use_public_bgp = true

# Agent-to-Agent Test
a2a_test_enabled        = true
a2a_test_interval       = 3600
a2a_test_direction      = "to-target"
a2a_test_dscp_id        = 34
a2a_test_alerts_enabled = true
a2a_test_bgp            = true
a2a_test_use_public_bgp = true