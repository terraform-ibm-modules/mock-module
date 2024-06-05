variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
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

variable "hpc_reservation_id" {
  type        = string
  description = "hpc_reservation_id"
  default     = "test"
}

variable "acme_key" {
  type        = string
  description = "acme_key"
  default     = "test1"
}

variable "logdna_key" {
  type        = string
  description = "logdna_key"
  default     = "test2"
}

variable "sdnlb_key" {
  type        = string
  description = "sdnlb_key"
  default     = "test3"
}
