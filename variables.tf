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

#############################################################################
# VPC Variables
##############################################################################

variable "classic_access" {
  description = "Enable VPC Classic Access. Note: only one VPC per region can have classic access"
  type        = bool
  default     = false
}
