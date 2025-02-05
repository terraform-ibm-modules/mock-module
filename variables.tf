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
  default     = "0.12.0" # helm datasource: https://charts.external-secrets.io
}

variable "eso_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... for ESO image to deploy. If not provided, a default value will be used."
  default     = "v0.11.0-ubi@sha256:41b6f0118fe9f3c57a20e33d42cb6006aaeb33561411db3c42a468201dfeae63" # docker datasource: ghcr.io/external-secrets/external-secrets
}

variable "reloader_chart_version" {
  type        = string
  description = "The version of the Reloader Helm chart."
  default     = "1.2.0" # helm datasource: https://stakater.github.io/stakater-charts
}

variable "reloader_image_digest" {
  type        = string
  description = "The image digest in the format sha256:xxxxx... the reloader image to deploy. If not provided, a default value will be used."
  default     = "v1.2.0-ubi@sha256:10253ddd79b8d681287a0122b379d41a026d3731e2bfac6c7b60b86e2dd57111" # docker datasource: ghcr.io/stakater/reloader
}
variable "watsonx_admin_api_key" {
  default     = null
  description = "Used to call Watson APIs to configure the user and the project."
  sensitive   = true
  type        = string
}

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

variable "resource_group_name" {
  default     = null
  description = "Name of the IBM Cloud resource group in which resources should be created"
  type        = string
}

variable "toolchain_region" {
  description = "The region where the toolchains previously created reside"
  type        = string
}

variable "toolchain_resource_group" {
  description = "The resource group where the toolchains previously created reside"
  type        = string
}

variable "create_continuous_delivery_service_instance" {
  description = "Choose whether to install a Continuous Delivery service instance or not"
  type        = bool
  default     = true
}

variable "ci_pipeline_id" {
  description = "ID of the CI pipeline"
  type        = string
}

variable "cd_pipeline_id" {
  description = "ID of the CD pipeline"
  type        = string
}

variable "inventory_repo_url" {
  description = "URL of the inventory repository"
  type        = string
  default     = null
}

variable "watson_assistant_instance_id" {
  description = "ID of the WatsonX Assistant service instance"
  type        = string
}

variable "watson_assistant_region" {
  description = "Region where WatsonX Assistant resides"
  type        = string
}

variable "watson_discovery_instance_id" {
  description = "ID of the WatsonX Discovery instance"
  type        = string
  default     = null # Discovery usage is optional, elastic can be used instead
}

variable "watson_discovery_region" {
  description = "Region where Watson Discovery resides"
  type        = string
  default     = null # Discovery usage is optional, elastic can be used instead
}

variable "watson_machine_learning_instance_crn" {
  description = "Watson Machine Learning instance CRN"
  type        = string
  default     = null # WML usage is optional, elastic can be used instead
}

variable "watson_machine_learning_instance_guid" {
  description = "Watson Machine Learning instance GUID"
  type        = string
  default     = null # WML usage is optional, elastic can be used instead
}

variable "watson_machine_learning_instance_resource_name" {
  description = "Watson Machine Learning instance resource name"
  type        = string
  default     = null # WML usage is optional, elastic can be used instead
}

variable "watson_project_name" {
  description = "Watson project name"
  type        = string
  default     = "RAG-sample-project"
}

variable "watson_project_sensitive" {
  description = "Mark Watson project as sensitive"
  type        = bool
  default     = false
}

variable "cos_kms_crn" {
  description = "Key Protect service instance CRN used to encrypt the COS buckets used by the watsonx projects."
  type        = string
  default     = null

  validation {
    condition = anytrue([
      can(regex("^crn:(.*:){3}kms:(.*:){2}[0-9a-fA-F]{8}(?:-[0-9a-fA-F]{4}){3}-[0-9a-fA-F]{12}::$", var.cos_kms_crn)),
      var.cos_kms_crn == null,
    ])
    error_message = "Key Protect CRN validation failed."
  }
}

variable "cos_kms_key_crn" {
  description = "Key Protect key CRN used to encrypt the COS buckets used by the watsonx projects. If not set, then the cos_kms_new_key_name must be specified."
  type        = string
  default     = null
}

variable "cos_kms_new_key_name" {
  description = "Name of the Key Protect key to create for encrypting the COS buckets used by the watsonx projects."
  type        = string
  default     = ""
}

variable "cos_kms_ring_id" {
  description = "The identifier of the Key Protect ring to create the cos_kms_new_key_name into. If it is not set, then the new key will be created in the default ring."
  type        = string
  default     = null
}

variable "elastic_instance_crn" {
  description = "Elastic ICD instance CRN"
  type        = string
  default     = null # Elastic usage is optional
}

variable "elastic_credentials_name" {
  description = "Name of service credentials used to access Elastic instance"
  type        = string
  default     = "wxasst_db_user"
}

variable "elastic_index_name" {
  description = "Name of index in Elastic instance"
  type        = string
  default     = "sample-rag-app-content"
}

variable "elastic_upload_sample_data" {
  description = "Upload sample artifacts to elastic index"
  type        = bool
  default     = true
}

variable "signing_key" {
  description = "Signing GPG key."
  type        = string
  sensitive   = true
}

variable "create_secrets" {
  description = "Create Secrets in the existing Secrets Manager instance."
  type        = bool
  default     = true
}

variable "secrets_manager_endpoint_type" {
  type        = string
  description = "The endpoint type to communicate with the provided secrets manager instance. Possible values are `public` or `private`"
  default     = "private"
  validation {
    condition     = contains(["private", "public"], var.secrets_manager_endpoint_type)
    error_message = "The specified service endpoint is not valid. Supported options are public, or private."
  }
}

variable "secrets_manager_guid" {
  description = "Secrets Manager GUID where the API key and signing key will be stored."
  type        = string
}

variable "secrets_manager_region" {
  description = "The region where the Secrets Manager instance previously created reside."
  type        = string
}

variable "trigger_ci_pipeline_run" {
  description = "Whether to trigger the CI pipeline to build and deploy the application when deploying this solution"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = null
}

# Need to have the count of zones to determine how many rules to add to the ACL for public ingress
variable "cluster_zone_count" {
  description = "Number of zones the cluster nodes are deployed in"
  type        = number
  default     = 2
}

variable "provision_public_ingress" {
  description = "Provision a public ingress controller with an Application Load Balancer for the sample app"
  type        = bool
  default     = true
}

