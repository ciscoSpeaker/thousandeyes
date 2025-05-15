terraform {

  cloud {
    organization = "thousandeyes"

    workspaces {
      name = "latam"
    }
  }

  required_providers {
    thousandeyes = {
      source = "thousandeyes/thousandeyes"
      version = "= 2.0.10"
    }
  }

  required_version = ">= 0.14.0"
}