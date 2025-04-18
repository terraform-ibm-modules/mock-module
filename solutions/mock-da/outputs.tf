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
  value       = var.resource_group != null ? var.resource_group : "${var.prefix}-rg"
}

output "resource_group_id" {
  description = "Resource Group ID"
  value       = var.resource_group != null ? data.ibm_resource_group.existing_resource_group[0].id : ibm_resource_group.resource_group[0].id
}

output "audit_webhook_listener_image_version" {
  description = "audit_webhook_listener_image_version"
  value       = var.audit_webhook_listener_image_version
}
