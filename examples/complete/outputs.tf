##############################################################################
# Outputs
##############################################################################

output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = module.mock-module.ssh_key_id
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = module.mock-module.fingerprint
}
