provider "aws" {
  region  = var.region
  version = "~> 2.43"
}

terraform {
  backend "s3" {
    bucket  = "terraform-upskill"
    key     = "envs/generics/terraform.tfstate"
    region  = "eu-north-1"
    # dynamodb_table = "" # charges may apply, necessary for locking
    encrypt = true
  }
}

resource "aws_s3_bucket" "terraform-upskill" {
  bucket = "terraform-upskill"
  acl    = "private"

  tags = {
    Name        = "terraform-upskill"
    Environment = var.env
  }
}
