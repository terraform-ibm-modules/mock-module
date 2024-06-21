# Create RSA key of size 4096 bits
resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "hello_world" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'Hello, World! from ${var.name} in RG ${var.resource_group_id} with tags ${var.tags} and SSH key ${tls_private_key.tls_key.public_key_openssh}'"
  }
}