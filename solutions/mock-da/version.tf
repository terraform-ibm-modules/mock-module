terraform {
  required_version = ">= 1.9.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "2.1.0"
    }
    # tflint-ignore: terraform_unused_required_providers
    restapi = {
      source  = "Mastercard/restapi"
      version = "2.0.1"
    }
  }
}
