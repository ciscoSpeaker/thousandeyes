terraform {
  cloud {
    organization = "thousandeyes"

    workspaces {
      name = "peruvian"
    }
  }

  required_providers {
    thousandeyes = {
      source  = "thousandeyes/thousandeyes"
      version = "~> 3.2.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }

  required_version = ">= 1.0.0"
}