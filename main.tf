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
