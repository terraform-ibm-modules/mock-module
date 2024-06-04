#############################################################################
# Call root level module
#############################################################################

module "mock_module" {
  source               = "../.."
  resource_group_names = var.resource_group_names
}
