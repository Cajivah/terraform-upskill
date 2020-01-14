provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "ec" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"

  tags = {
    name  = "example"
    owner = "jmalyjasiak@pgs-soft.com"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.ec.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}

// alb output powinien zwrócić adres na który można wejść, żeby uruchomić

// to samo rds, ale z komendą połączeniową do bazy
// parameter store w ssm, skonfigurować terraforma, żęby z niego korzystał