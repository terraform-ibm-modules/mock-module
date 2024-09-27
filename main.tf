locals {
  rg_map = {
    for rg in var.resource_group_names :
    "${rg}-resource-group" => {
      name = rg
    }
  }
}
resource "ibm_resource_group" "resource_group" {
  for_each = local.rg_map
  name     = each.value.name
  quota_id = null
}
