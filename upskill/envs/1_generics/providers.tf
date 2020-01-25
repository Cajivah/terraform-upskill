provider "aws" {
  region  = var.region
  version = "~> 2.43"
}

terraform {
  backend "s3" {
    bucket  = "jmalyjasiak-upskill"
    key     = "envs/generics/terraform.tfstate"
    region  = "eu-north-1"
    # dynamodb_table = "" # charges may apply, necessary for locking
    encrypt = true
  }
}

