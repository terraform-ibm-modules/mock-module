variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}
variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-south"
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "mock"
}

variable "resource_group" {
  type        = string
  description = "An existing resource group name to use for this example, if unset a new resource group will be created"
  default     = null
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}

variable "testing" {
  type        = list(string)
  description = "Test variable to test setting list of strings to null"
  default     = null
}

variable "audit_webhook_listener_image_version" {
  type        = string
  description = "The tag or digest for the audit webhook listener image to deploy. If changing the value, ensure it is compatible with `audit_webhook_listener_image`."
  nullable    = false
  default     = "9e767ffcc9285bd4734faf7f1b00591cdc01660b@sha256:053fa23ddc39557639398b12ddb5a27600b34c60bbc458127b80da2be29b00bc" # datasource: icr.io/ibm/ibmcloud-kube-audit-to-ibm-cloud-logs
  validation {
    condition     = can(regex("^[a-f0-9]{40}@sha256:[a-f0-9]{64}$", var.audit_webhook_listener_image_version))
    error_message = "The value of the audit webhook listener image version must match the tag and sha256 image digest format"
  }
}
