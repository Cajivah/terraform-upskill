data "template_file" "instance-role-policy" {
  template = file("${path.module}/policies/instance-role-policy.json")
  vars {
    env = var.env
  }
}
