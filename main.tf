locals {
  resource_group_id = var.resource_group_id != null ? var.resource_group_id : "null"
  tags              = var.tags != null ? join(",", var.tags) : "none"
}
# Create RSA key of size 4096 bits
resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "terraform_data" "hello_world" {
  triggers_replace = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Hello, World! from ${var.name} in RG_id ${local.resource_group_id} with tags ${local.tags}.'"
  }
}

resource "terraform_data" "hello_world_add" {
  triggers_replace = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Hello, World ADDED FOR TEST! from ${var.name} in RG_id ${local.resource_group_id} with tags ${local.tags}.'"
  }
}
