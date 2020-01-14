resource "aws_subnet" "alb_public_subnet" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].alb_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "web_server_private_subnet" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].web_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "db_private_subnet" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].db_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = aws_vpc.vpc.id
}
