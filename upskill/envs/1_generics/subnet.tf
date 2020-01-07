resource "aws_subnet" "alb_public_subnet" {
  for_each = var.zones
  cidr_block = each.value.alb_subnet_cidr
  availability_zone = each.value.zone
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "web_server_private_subnet" {
  for_each = var.zones
  cidr_block = each.value.web_subnet_cidr
  availability_zone = each.value.zone
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "db_private_subnet" {
  for_each = var.zones
  cidr_block = each.value.db_subnet_cidr
  availability_zone = each.value.zone
  vpc_id = aws_vpc.vpc.id
}
