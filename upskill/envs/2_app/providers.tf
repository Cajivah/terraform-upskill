provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-upskill"
    key = "envs/app/terraform.tfstate"
    region = "eu-west-2"
    # dynamodb_table = "" # charges may apply, necessary for locking
    encrypt = true
  }
}
