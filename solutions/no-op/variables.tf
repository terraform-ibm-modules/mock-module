variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
}

variable "no-op-nul-number" {
  type        = number
  description = "No-op variable to test setting a number to null"
  default     = null
}

variable "notset-number" {
  type        = number
  description = "No-op variable to test not setting a number"
}

variable "no-op-nul-bool" {
  type        = bool
  description = "No-op variable to test setting a bool to null"
  default     = null
}

variable "notset-bool" {
  type        = bool
  description = "No-op variable to test not setting a bool"
}

variable "no-op-nul-list" {
  type        = list(string)
  description = "No-op variable to test setting a list to null"
  default     = null
}

variable "notset-list" {
  type        = list(string)
  description = "No-op variable to test not setting a list"
}

variable "no-op-nul-map" {
  type        = map(string)
  description = "No-op variable to test setting a map to null"
  default     = null
}

variable "notset-map" {
  type        = map(string)
  description = "No-op variable to test not setting a map"
}

variable "no-op-nul-set" {
  type        = set(string)
  description = "No-op variable to test setting a set to null"
  default     = null
}

variable "notset-set" {
  type        = set(string)
  description = "No-op variable to test not setting a set"
}

variable "no-op-nul-object" {
  type        = object({
    name = string
    age  = number
  })
  description = "No-op variable to test setting an object to null"
  default     = null
}

variable "notset-object" {
  type        = object({
    name = string
    age  = number
  })
  description = "No-op variable to test not setting an object"
}

variable "no-op-nul-tuple" {
  type        = tuple([string, number])
  description = "No-op variable to test setting a tuple to null"
  default     = null
}

variable "notset-tuple" {
  type        = tuple([string, number])
  description = "No-op variable to test not setting a tuple"
}

variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-south"
}

variable "no-op-nul-string" {
  type        = string
  description = "No-op variable to test setting a string to null"
  default     = null
  
}

variable "notset-string" {
  type        = string
  description = "No-op variable to test not setting a string"
  
}
