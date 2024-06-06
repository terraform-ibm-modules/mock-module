output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = ibm_is_ssh_key.ssh_key.id
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = ibm_is_ssh_key.ssh_key.fingerprint
}

output "vpc_id" {
  description = "ID of VPC created"
  value       = ibm_is_vpc.vpc.id
}

output "vpc_crn" {
  description = "CRN of VPC created"
  value       = ibm_is_vpc.vpc.crn
}

output "test_var_value" {
  description = "hpc_reservation_id"
  value       = local.test_var
  sensitive   = true
}
