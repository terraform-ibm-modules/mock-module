output "resource_group" {
  description = "Resource Group Names"
  value = [
    for rg_names in ibm_resource_group.resource_group :
    rg_names.id
  ]
}
