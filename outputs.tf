output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = tls_private_key.tls_key.public_key_openssh
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = tls_private_key.tls_key.public_key_fingerprint_sha256
}

output "eso_chart_version" {
  description = "eso_chart_version"
  value       = var.eso_chart_version
}

output "eso_image_digest" {
  description = "eso_image_digest"
  value       = var.eso_image_digest
}

output "reloader_chart_version" {
  description = "reloader_chart_version"
  value       = var.reloader_chart_version
}

output "reloader_image_digest" {
  description = "reloader_image_digest"
  value       = var.reloader_image_digest
}
