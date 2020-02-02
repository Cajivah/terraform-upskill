resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.ig_name
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags          = {
    Name = local.nat_name
  }
}

resource "aws_subnet" "public" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].alb_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id

  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "private" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].web_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id
}

resource "aws_subnet" "db_private_subnet" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].db_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.public_rt_name
  }
}

resource "aws_route" "to_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = local.any_ip
  gateway_id             = aws_internet_gateway.ig.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.private_rt_name
  }
}

resource "aws_route" "to_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = local.any_ip
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

