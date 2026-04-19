variable "te_token" {
  description = "ThousandEyes OAuth authentication token"
  type        = string
  sensitive   = true
}

variable "te_aid" {
  description = "Account Group ID"
  type        = number
}

variable "te_timeout" {
  description = "The timeout value"
  type        = number
}

variable "http_interval" {
  type = number
}

variable "A2A_interval" {
  type = number
}

variable "A2A_direction" {
  type = string
}

variable "A2A_protocol" {
  type = string
}

variable "alerts" {
  type    = bool
  default = false
}

variable "bgp" {
  type    = bool
  default = false
}

variable "dscp" {
  type = number
}

variable "test_enabled" {
  type = bool
}

variable "a2a_alert_rule_ids" {
  description = "List of ThousandEyes alert rule IDs for Agent-to-Agent tests"
  type        = list(number)
  default     = []
}

variable "use_public_bgp" {
  description = "Use ThousandEyes public BGP monitors globally. Set to false to restrict to selected monitors only."
  type        = bool
  default     = false
}