terraform {
  required_version = ">= 1.9.0"
  required_providers {

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.4, < 5.0.0"
    }
    # tflint-ignore: terraform_unused_required_providers
    restapi = {
      source  = "Mastercard/restapi"
      version = "2.0.1"
    }
  }
}
