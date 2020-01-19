zones =  [
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

