data "terraform_remote_state" "generics" {
  backend = "s3"

  config = {
    bucket = var.generics_state_bucket
    key    = var.generics_state_key
    region = var.region
  }
}
