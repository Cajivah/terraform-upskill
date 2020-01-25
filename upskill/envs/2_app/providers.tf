provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket  = "jmalyjasiak-upskill"
    key     = "envs/app/terraform.tfstate"
    region  = "eu-north-1"
    # dynamodb_table = "" # charges may apply, necessary for locking
    encrypt = true
  }
}
