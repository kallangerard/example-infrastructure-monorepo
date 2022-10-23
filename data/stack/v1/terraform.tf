terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    postgresql = {

    }
  }

  required_version = ">= 1.2.0"
}

