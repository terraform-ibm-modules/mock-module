provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = "us-south"
  visibility = "private"
}

variable "ibmcloud_api_key" {
  type = string
}

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.79.0"
    }
  }
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "test-ins"
  resource_group_id = "07b6d899988a4631841e3bc7d0307dcf"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

resource "ibm_resource_key" "resource_keys" {
  name                 = "test-rk"
  resource_instance_id = ibm_resource_instance.cos_instance.id
  role                 = "Reader"
}

data "ibm_resource_key" "elastic_credentials" {
  depends_on = [ ibm_resource_key.resource_keys ]
  resource_instance_id = ibm_resource_instance.cos_instance.crn
  name                 = "test-rk"
}