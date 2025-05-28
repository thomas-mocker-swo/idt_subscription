terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.connectivity_subscription_id
  tenant_id       = var.tenant_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  use_oidc = true
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.identity_subscription_id
  tenant_id       = var.tenant_id
  features {}
  use_oidc = true
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.management_subscription_id
  tenant_id       = var.tenant_id
  features {}
  use_oidc = true
}