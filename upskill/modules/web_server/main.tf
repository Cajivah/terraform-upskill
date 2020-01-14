resource "aws_instance" "web" {
  count = length(var.zones)
  ami = var.web_ami
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  user_data = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.zones[count.index].zone}_web"
  }
}
