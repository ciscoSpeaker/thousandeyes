terraform {

  cloud {
    organization = "thousandeyes"

    workspaces {
      name = "ciscostore"
    }
  }

  required_providers {
    thousandeyes = {
      source = "thousandeyes/thousandeyes"
      version = ">= 2.0.1"
    }
  }

  required_version = ">= 0.14.0"
}