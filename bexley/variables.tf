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
}

variable "test_interval" {
  type  = number
}

variable "alerts" {
  type  = string
}

variable "bgp" {
  type  = string
}