output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = tls_private_key.tls_key.public_key_openssh
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = tls_private_key.tls_key.public_key_fingerprint_sha256
}
