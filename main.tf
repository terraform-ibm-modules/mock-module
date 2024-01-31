# Create RSA key of size 4096 bits
resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Import SSH key to IBM Cloud
resource "ibm_is_ssh_key" "ssh_key" {
  name           = var.name
  resource_group = var.resource_group_id
  public_key     = resource.tls_private_key.tls_key.public_key_openssh
  tags           = var.tags
}

# Create a VPC
resource "ibm_is_vpc" "vpc" {
  name                        = "${var.name}-vpc"
  resource_group              = var.resource_group_id
  classic_access              = var.classic_access
  default_network_acl_name    = "${var.name}-edge-acl"
  default_security_group_name = "${var.name}-default-sg"
  default_routing_table_name  = "${var.name}-default-table"
  address_prefix_management   = "manual"
  tags                        = var.tags
}
