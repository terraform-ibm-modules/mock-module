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

variable "hpc_reservation_id" {
  type        = string
  description = "hpc_reservation_id"
  default     = "test"
}

variable "acme_key" {
  type        = string
  description = "acme_key"
  default     = "test"
}

variable "logdna_key" {
  type        = string
  description = "logdna_key"
  default     = "test"
}

variable "sdnlb_key" {
  type        = string
  description = "sdnlb_key"
  default     = "test"
}
