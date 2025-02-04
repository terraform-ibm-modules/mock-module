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

variable "eso_chart_version" {
  type        = string
  description = "The version of the External Secrets Operator Helm chart."
  default     = "0.12.0" # helm datasource: charts.external-secrets.io
}

variable "eso_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... for ESO image to deploy. If not provided, a default value will be used."
  default     = "v0.14.0-ubi@sha256:492d29ffe707422ee4cbcf949ef3e317bd2b15b3c728a30c8c03a5a0567030c3" # docker datasource: ghcr.io/external-secrets/external-secrets
}

variable "reloader_chart_version" {
  type        = string
  description = "The version of the Reloader Helm chart."
  default     = "1.2.0" # helm datasource: stakater.github.io/stakater-charts
}

variable "reloader_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... the reloader image to deploy. If not provided, a default value will be used."
  default     = "v1.2.1-ubi@sha256:80a557100c6835c7e3c9842194250c9c4ca78f43200bc3a93a32e5b105ad11bb" # docker datasource: ghcr.io/stakater/reloader
}
