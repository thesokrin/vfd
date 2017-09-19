# Atlas Hub - Psyclone Resources - Atlas Data Providers

data "terraform_remote_state" "environment" {
  backend = "s3"
  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/${var.atlas_environment == "hub" ? "hubs/hub1/atlas" :
      "environments/${var.atlas_environment}/atlas"}.tfstate"
  }
}

data "terraform_remote_state" "hub" {
  backend = "s3"
  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/hubs/hub1/atlas.tfstate"
  }
}
