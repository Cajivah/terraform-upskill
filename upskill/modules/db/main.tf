resource "aws_db_instance" "db" {
  count = length(var.zones)
  identifier = "${var.zones[count.index].zone}_db"

  engine = var.engine
  engine_version = var.engine_version
  allocated_storage = var.allocated_storage
  instance_class = var.instance_type

  name = var.db_name
  username = var.username
  password = var.db_password

  vpc_security_group_ids = [var.security_group_ids[count.index]]
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
}

resource "aws_db_subnet_group" "db_subnet" {
  count = length(var.zones)
  name = "${var.zones[count.index].zone}_db_subnet"
  subnet_ids = [var.subnet_ids[count.index]]
}
