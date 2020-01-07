data "template_file" "user_data" {
  template = file("${path.module}/scripts/user-data.sh")

  vars = {
    server_port = var.server_port
  }
}
