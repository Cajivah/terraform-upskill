data "template_file" "instance-role-policy" {
  template = file("${path.module}/policies/instance-role-policy.json")
}

data "template_file" "instance-role" {
  template = file("${path.module}/policies/instance-role.json")
}

