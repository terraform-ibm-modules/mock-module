output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = tls_private_key.tls_key.public_key_openssh
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = tls_private_key.tls_key.public_key_fingerprint_sha256
}

output "audit_webhook_listener_image_version" {
  description = "audit_webhook_listener_image_version"
  value       = var.audit_webhook_listener_image_version
}
