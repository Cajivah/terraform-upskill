resource "aws_db_instance" "db" {
  identifier = "${var.env}-db"

  engine            = var.engine
  engine_version    = var.engine_version
  allocated_storage = var.allocated_storage
  instance_class    = var.instance_type

  name     = var.db_name
  username = var.username
  password = var.db_password

  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

  tags = var.tags
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.env}_db_subnet_group"
  subnet_ids = var.subnet_ids
  tags       = var.tags
}
