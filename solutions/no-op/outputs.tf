##############################################################################
# Outputs
##############################################################################


output "module_ssh_key_id" {
  description = "The ssh_key_id from the module"
  value       = module.mock_module.ssh_key_id
}
