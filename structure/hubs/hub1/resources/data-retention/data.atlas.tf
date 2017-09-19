# Atlas Hub - Data Retention Resources - Atlas Data Providers

data "terraform_remote_state" "hub" {
  backend = "s3"
  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/hubs/hub1/atlas.tfstate"
  }
}
