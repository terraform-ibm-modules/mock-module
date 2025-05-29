##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.2.0"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

##############################################################################
# SM
##############################################################################

resource "ibm_resource_instance" "secrets_manager_instance" {
  name              = "${var.prefix}-sm"
  service           = "secrets-manager"
  plan              = "trial"
  location          = "us-south"
  resource_group_id = module.resource_group.resource_group_id
  tags              = var.resource_tags
  timeouts {
    create = "30m"
  }
}

#############################################################################
# Call root level module to create SSH key
#############################################################################

module "mock_module" {
  source            = "../.."
  name              = var.prefix
  resource_group_id = module.resource_group.resource_group_id
  tags              = var.resource_tags
}
