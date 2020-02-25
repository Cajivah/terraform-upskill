resource "aws_internet_gateway" "jmalyjasiak-ig" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.ig_name
  }
}

resource "aws_eip" "jmalyjasiak-nat" {
  vpc = true
}

resource "aws_nat_gateway" "jmalyjasiak-nat" {
  allocation_id = aws_eip.jmalyjasiak-nat.id
  subnet_id     = aws_subnet.jmalyjasiak-public[0].id
  tags          = {
    Name = local.nat_name
  }
}

resource "aws_subnet" "jmalyjasiak-public" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].alb_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id

  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "jmalyjasiak-private" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].web_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id
}

resource "aws_subnet" "jmalyjasiak-db_private_subnet" {
  count             = length(var.zones)
  cidr_block        = var.zones[count.index].db_subnet_cidr
  availability_zone = var.zones[count.index].zone
  vpc_id            = var.vpc_id
}

resource "aws_route_table" "jmalyjasiak-public" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.public_rt_name
  }
}

resource "aws_route" "jmalyjasiak-to_internet_gateway" {
  route_table_id         = aws_route_table.jmalyjasiak-public.id
  destination_cidr_block = local.any_ip
  gateway_id             = aws_internet_gateway.jmalyjasiak-ig.id
}

resource "aws_route_table_association" "jmalyjasiak-public" {
  count          = length(aws_subnet.jmalyjasiak-public)
  subnet_id      = aws_subnet.jmalyjasiak-public[count.index].id
  route_table_id = aws_route_table.jmalyjasiak-public.id
}

resource "aws_route_table" "jmalyjasiak-private" {
  vpc_id = var.vpc_id

  tags = {
    Name = local.private_rt_name
  }
}

resource "aws_route" "jmalyjasiak-to_nat_gateway" {
  route_table_id         = aws_route_table.jmalyjasiak-private.id
  destination_cidr_block = local.any_ip
  nat_gateway_id         = aws_nat_gateway.jmalyjasiak-nat.id
}

resource "aws_route_table_association" "jmalyjasiak-private" {
  count          = length(aws_subnet.jmalyjasiak-private)
  subnet_id      = aws_subnet.jmalyjasiak-private[count.index].id
  route_table_id = aws_route_table.jmalyjasiak-private.id
}

