# Atlas Production Environment - Data Retention Resources - Atlas Data Providers

data "terraform_remote_state" "environment" {
  backend = "s3"
  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/${var.env_name == "hub" ? "hubs/hub1/atlas" :
      "environments/${var.env_name}/atlas"}.tfstate"
  }
}
