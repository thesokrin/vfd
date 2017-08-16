# # Codis Proxy Module - Atlas Data Resources

data "terraform_remote_state" "atlas" {
  backend = "s3"
  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/${var.atlas_environment == "hub" ? "hubs/hub1/atlas" :
      "environments/${var.atlas_environment}/atlas"}.tfstate"
  }
}
