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

output "test" {
  description = "test"
  value       = var.testing
}

output "resource_group" {
  description = "Resource Group Name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource Group ID"
  value       = module.resource_group.resource_group_id
}
