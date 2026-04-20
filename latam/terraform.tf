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
      version = ">= 3.0.0"    # ← era = 2.0.10
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }

  required_version = ">= 0.14.0"
}