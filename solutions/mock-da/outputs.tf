##############################################################################
# Outputs
##############################################################################

output "resource_group" {
  description = "Resource Group Names"
  value       = module.mock_module.resource_group
}
