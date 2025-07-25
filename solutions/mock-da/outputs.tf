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

output "next_steps_text" {
  value       = "**Congratulations! You successfully deployed your changes. Next, view your Secrets Manager instance.** Also check out [Cloud automation for Secrets Manager private certificates engine](https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/dep[…]rivate-cert-engine-571d2eb7-e416-40a4-aa95-be05e6155af8-global)"
  description = "Next steps text"
}

output "next_step_primary_label" {
  value       = "View Secrets Manager [public-cert-engine](https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/deploy-arch-secrets-manager-public-cert-engine-79d8474b-7105-4c36-81d7-989f042bce0e-global)"
  description = "Primary label"
}

output "next_step_primary_url" {
  value       = "[public-cert-engine](https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/deploy-arch-secrets-manager-public-cert-engine-79d8474b-7105-4c36-81d7-989f042bce0e-global), [public-cert-engine2](https://cloud.ibm.com/catalog/7a4d68b4-cf8b-40cd-a3d1-f49aff526eb3/architecture/deploy-arch-secrets-manager-public-cert-engine-79d8474b-7105-4c36-81d7-989f042bce0e-global)"
  description = "primary url"
}
