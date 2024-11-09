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
variable "test_A2A_interval" {
  type  = number
}

variable "test_A2A_direction" {
  type  = string
}
variable "test_A2A_protocol" {
  type  = string
}

variable "alerts" {
  type = bool
  default = false 
}

variable "bgp" {
  type  = string
}

variable "dscp" {
  type  = string
}

variable "test_enabled" {
  type  = string
}