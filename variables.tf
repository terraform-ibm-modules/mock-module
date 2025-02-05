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
  # renovate: datasource=github-tags depName=external-secrets/external-secrets versioning="regex:^helm-chart-(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
  default = "0.12.0"
}

variable "eso_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... for ESO image to deploy. If not provided, a default value will be used."
  default     = "v0.11.0-ubi@sha256:41b6f0118fe9f3c57a20e33d42cb6006aaeb33561411db3c42a468201dfeae63" # docker datasource: ghcr.io/external-secrets/external-secrets
}

variable "reloader_chart_version" {
  type        = string
  description = "The version of the Reloader Helm chart."
  # renovate: datasource=github-releases depName=stakater/Reloader
  default = "1.2.1"
}

variable "reloader_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... the reloader image to deploy. If not provided, a default value will be used."
  default     = "v1.2.0-ubi@sha256:10253ddd79b8d681287a0122b379d41a026d3731e2bfac6c7b60b86e2dd57111" # docker datasource: ghcr.io/stakater/reloader
}
