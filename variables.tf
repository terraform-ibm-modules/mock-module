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
variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the Databases for Redis instance created by the solution. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []
}
