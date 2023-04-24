terraform {
  cloud {
    organization = "LCC-eCom"
    workspaces {
      tags = ["eCom","source:cli"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.55"
    }
  }
  required_version = ">= 1.2.0"

}