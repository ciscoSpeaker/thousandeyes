variable "te_token" {
  description = "ThousandEyes OAuth authentication token"
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
}

variable "test_http_interval" {
  type  = number
}

variable "test_transaction_interval" {
  type  = number
}

variable "test_dns_interval" {
  type  = number
}

variable "test_vpn_interval" {
  type  = number
}

variable "alerts" {
  type = bool
  default = false 
}

variable "bgp" {
  type  = string
}

variable "bgp_monitor" {
  type  = number
}

variable "target_time" {
  type  = number
}

variable "time_limit" {
  type  = number
}

variable "user_agent" {
  type  = string
}

variable "test_enabled" {
  type = bool
  default = false
}