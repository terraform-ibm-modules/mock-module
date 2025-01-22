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

variable "trusted_profile_roles" {
  type        = list(string)
  description = "A list of roles given to the trusted profile."
  default     = ["Administrator"]
}

variable "allowed_ip_addresses" {
  description = " A list of the IP addresses and subnets from which IAM tokens can be created for the account."
  type        = list(string)
  default     = []
}

variable "activity_tracker_locations" {
  type        = list(string)
  description = "The location of the route for Activity Tracker. Logs from these locations are sent to the specified target. Supports passing individual regions, `global`, and `*`."
  default     = ["*", "global"]
}

variable "cos_bucket_access_tags" {
  type        = list(string)
  description = "A list of access tags applied to the Object Storage bucket that this module provisions."
  default     = []
}

variable "cos_instance_access_tags" {
  type        = list(string)
  description = "A list of access tags applied to the Object Storage instance that this module provisions."
  default     = []
}
