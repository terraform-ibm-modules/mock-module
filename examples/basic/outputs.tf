##############################################################################
# Outputs
##############################################################################

output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = module.mock_module.ssh_key_id
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = module.mock_module.fingerprint
}

output "test_var_value" {
  description = "hpc_reservation_id"
  value       = module.mock_module.test_var_value
}
