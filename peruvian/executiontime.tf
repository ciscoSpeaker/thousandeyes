#locals {
#  timenow = timestamp()
#  now = formatdate("hh:mm:ss ZZZ - MMM/DD/YYYY", local.timenow)
#}

#output "execution_time" {
#  value = local.timenow
#}

terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
}

resource "time_static" "execution_time" {}

output "execution_time" {
  value = time_static.execution_time.rfc3339
}