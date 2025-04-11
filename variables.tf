variable "name" {
  description = "Name of the SSH Key."
  type        = string
}

variable "resource_group_id" {
  description = "ID of resource group. If not specified, Default resource group used."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the SSH Key."
  type        = list(string)
  default     = []
}

variable "audit_webhook_listener_image_version" {
  type        = string
  description = "The tag or digest for the audit webhook listener image to deploy. If changing the value, ensure it is compatible with `audit_webhook_listener_image`."
  nullable    = false
  default     = "122e7a6c887ef24fea3095518857a708bd84b1e4@sha256:04c08891cd0201e11ecc6fe4f7b016ed137989010ced987cab57be5c7af3915a" # datasource: icr.io/ibm/ibmcloud-kube-audit-to-ibm-cloud-logs
  validation {
    condition     = can(regex("^[a-f0-9]{40}@sha256:[a-f0-9]{64}$", var.audit_webhook_listener_image_version))
    error_message = "The value of the audit webhook listener image version must match the tag and sha256 image digest format"
  }
}
