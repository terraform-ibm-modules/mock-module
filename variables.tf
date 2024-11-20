variable "resource_group_names" {
  type        = list(string)
  description = "List of resource group names to be created."
  default     = []
}

variable "tags" {
  description = "List of Tags for the SSH Key."
  type        = list(string)
  default     = []
}
