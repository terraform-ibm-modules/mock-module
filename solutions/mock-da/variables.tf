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

variable "resource_group_names" {
  type        = list(string)
  description = "List of resource group names to be created."
  default     = ["mock1", "mock2"]
}

variable "tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}