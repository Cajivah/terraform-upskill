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

region = "eu-north-1"

owner = "jmalyjasiak"

tags  = {
  Name  = "jmalyjasiak-upskill",
  Owner = "jmalyjasiak"
}
