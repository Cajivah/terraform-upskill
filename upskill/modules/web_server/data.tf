data "template_file" "user_data" {
  template = file("${path.module}/scripts/user-data.sh")

  vars = {
    server_port = var.server_port
    username_key = var.db_username_key
    password_key = var.db_password_key
    db_address = var.db_address
    db_port = var.db_port
    region = var.region
  }
}
