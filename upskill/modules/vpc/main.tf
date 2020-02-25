resource "aws_vpc" "jmalyjasiak-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
}
