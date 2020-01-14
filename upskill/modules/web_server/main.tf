resource "aws_instance" "web" {
  ami = var.web_ami
  instance_type = var.instance_type
  security_groups = [var.security_group_id]
  user_data = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.prefix}_web"
  }
}
