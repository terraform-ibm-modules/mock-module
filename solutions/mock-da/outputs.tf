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

output "vpc_id" {
  description = "ID of VPC created"
  value       = module.mock_module.vpc_id
}

output "vpc_crn" {
  description = "CRN of VPC created"
  value       = module.mock_module.vpc_crn
}
