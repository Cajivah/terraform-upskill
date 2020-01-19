zones = [
  {
    zone = "eu-west-1a",
    alb_subnet_cidr = "10.0.0.0/28",
    web_subnet_cidr = "10.0.0.192/26",
    db_subnet_cidr = "10.0.0.16/28"
  },
  {
    zone = "eu-west-1b"
    alb_subnet_cidr = "10.0.1.0/28",
    web_subnet_cidr = "10.0.1.192/26",
    db_subnet_cidr = "10.0.1.16/28"
  },
  {
    zone = "eu-west-1c"
    alb_subnet_cidr = "10.0.2.0/28",
    web_subnet_cidr = "10.0.2.192/26",
    db_subnet_cidr = "10.0.2.16/28"
  }
]

env = "prod"
region = "eu-west-1"

min_web_scaling = 1
max_web_scaling = 6

domain_name = "jmalyjasiak.pgssandbox.com"

allowed_external_ips = [
  // pgs wro cidrs
  "188.114.87.10/32",
  "188.114.87.11/32"
]

ssl_cert_arn = "arn:aws:acm:eu-west-1:890769921003:certificate/25399ad1-51cb-47c9-931a-2f8db54f499a"

