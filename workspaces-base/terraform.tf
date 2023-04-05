terraform {
  required_providers {
    tfe = {
      version = "~> 0.43.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}

terraform {
  cloud {
    organization = "kallangerard"
    hostname     = "app.terraform.io"
  }
}
