zones = [
  {
    zone            = "eu-north-1a",
    alb_subnet_cidr = "10.0.0.0/28",
    web_subnet_cidr = "10.0.0.192/26",
    db_subnet_cidr  = "10.0.0.16/28"
  },
  {
    zone            = "eu-north-1b"
    alb_subnet_cidr = "10.0.1.0/28",
    web_subnet_cidr = "10.0.1.192/26",
    db_subnet_cidr  = "10.0.1.16/28"
  },
  {
    zone            = "eu-north-1c"
    alb_subnet_cidr = "10.0.2.0/28",
    web_subnet_cidr = "10.0.2.192/26",
    db_subnet_cidr  = "10.0.2.16/28"
  }
]

env    = "prod"
region = "eu-north-1"

min_web_scaling = 1
max_web_scaling = 6

domain_name = "jmalyjasiak.pgssandbox.com"

allowed_external_ips = [
  // pgs wro cidrs
  //  "188.114.87.10/32",
  //  "188.114.87.11/32"

  // app ips
  "0.0.0.0/0"
]

ssl_cert_arn = "arn:aws:acm:eu-north-1:890769921003:certificate/5a429d32-3165-49e4-9e10-9e79eff49766"

tags = {
  Name  = "jmalyjasiak-upskill",
  Owner = "jmalyjasiak"
}

