data "terraform_remote_state" "generics" {
  backend = "s3"

  config = {
    bucket = local.generics_state_bucket
    key    = local.generics_state_key
    region = var.region
  }
}
