variable "te_token" {
  description = "ThousandEyes OAuth Authentication token"
  type = string
  sensitive = true
}

variable "te_aid" {
  description = "Account Group ID"
  type  = string
}

variable "te_timeout" {
  description = "The timeout value."
  type  = number
  default  = 1000
}

# HTTP Test Variables

variable "http_test_enabled" {
  description = "Enable or disable the HTTP test"
  type        = bool
  default     = true
}

variable "http_test_interval" {
  description = "Interval for the HTTP test in seconds"
  type        = number
  default     = 3600
}

variable "http_test_alerts_enabled" {
  description = "Enable alerts for the HTTP test"
  type        = bool
  default     = true
}

variable "http_test_bgp" {
  description = "Enable BGP measurements for the HTTP test"
  type        = bool
  default     = true
}

variable "http_test_use_public_bgp" {
  description = "Use public BGP for the HTTP test"
  type        = bool
  default     = true
}


# Voice Test Variables

variable "voice_test_enabled" {
  description = "Enable or disable the Voice test"
  type        = bool
  default     = true
}

variable "voice_test_interval" {
  description = "Interval for the Voice test in seconds"
  type        = number
  default     = 3600
}

variable "voice_test_alerts_enabled" {
  description = "Enable alerts for the Voice test"
  type        = bool
  default     = true
}

variable "voice_test_bgp" {
  description = "Enable BGP measurements for the Voice test"
  type        = bool
  default     = true
}

variable "voice_test_use_public_bgp" {
  description = "Use public BGP for the Voice test"
  type        = bool
  default     = true
}

variable "voice_test_dscp_id" {
  description = "DSCP ID value for the Voice test"
  type        = number
  default     = 46
}

# Agent-to-Server Variables

variable "a2s_test_enabled" {
  description = "Enable or disable the Agent-to-Server test"
  type        = bool
  default     = true
}

variable "a2s_test_interval" {
  description = "Interval for the Agent-to-Server test in seconds"
  type        = number
  default     = 3600
}

variable "a2s_test_alerts_enabled" {
  description = "Enable alerts for the Agent-to-Server test"
  type        = bool
  default     = true
}

variable "a2s_test_bgp" {
  description = "Enable BGP measurements for the Agent-to-Server test"
  type        = bool
  default     = true
}

variable "a2s_test_use_public_bgp" {
  description = "Use public BGP for the Agent-to-Server test"
  type        = bool
  default     = true
}

# Agent-to-Agent Test Variables

variable "a2a_test_enabled" {
  description = "Enable or disable the Agent-to-Agent test"
  type        = bool
  default     = true
}

variable "a2a_test_interval" {
  description = "Interval for the Agent-to-Agent test in seconds"
  type        = number
  default     = 3600
}

variable "a2a_test_direction" {
  description = "Traffic direction for Agent-to-Agent test (e.g., to-target)"
  type        = string
  default     = "to-target"
}

variable "a2a_test_dscp_id" {
  description = "DSCP ID value for the Agent-to-Agent test"
  type        = number
  default     = 34
}

variable "a2a_test_alerts_enabled" {
  description = "Enable alerts for the Agent-to-Agent test"
  type        = bool
  default     = true
}

variable "a2a_test_bgp" {
  description = "Enable BGP measurements for the Agent-to-Agent test"
  type        = bool
  default     = true
}

variable "a2a_test_use_public_bgp" {
  description = "Use public BGP for the Agent-to-Agent test"
  type        = bool
  default     = true
}