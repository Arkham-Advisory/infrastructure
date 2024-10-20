terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.41"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.112.0"
    }
  }
  required_version = ">= 1.1.0"

    backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatefreier"
    container_name       = "tfstate"
    key                  = "arkham_advisory/infrastructure/prd/infrastructure.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}
