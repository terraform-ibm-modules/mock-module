locals {
  resource_group_id                     = var.resource_group_id != null ? var.resource_group_id : "null"
  tags                                  = var.tags != null ? join(",", var.tags) : "none"
  logs_routing_agent_init_image_version = "1.6.2@sha256:d6f9964bbbe7c735b8e14a3496e30c403c067d3f729302eec6146626b117b515" # datasource: icr.io/ibm/observe/logs-router-agent-init
  logs_routing_agent_image_version      = "1.6.2@sha256:dee214b548e063319f206c4c17e0015b57a9480031a89eb6125ce19a026bd116" # datasource: icr.io/ibm/observe/logs-router-agent
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
