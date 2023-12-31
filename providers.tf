terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.21.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.49.2"
    }
  }
}

provider "vault" {
  address = var.vault_address
}

provider "aws" {
  region = var.region
}
