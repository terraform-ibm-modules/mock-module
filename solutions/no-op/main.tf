#############################################################################
# Call root level module to create SSH key
#############################################################################

locals {
  prefix           = var.prefix
  no-op-nul-number = var.no-op-nul-number
  notset-number    = var.notset-number
  no-op-nul-bool   = var.no-op-nul-bool
  notset-bool      = var.notset-bool
  no-op-nul-list   = var.no-op-nul-list
  notset-list      = var.notset-list
  no-op-nul-map    = var.no-op-nul-map
  notset-map       = var.notset-map
  no-op-nul-set    = var.no-op-nul-set
  notset-set       = var.notset-set
  no-op-nul-object = var.no-op-nul-object
  notset-object    = var.notset-object
  no-op-nul-tuple  = var.no-op-nul-tuple
  notset-tuple     = var.notset-tuple
  region           = var.region
  no-op-nul-string = var.no-op-nul-string
  notset-string    = var.notset-string
}

module "mock_module" {
  source = "../.."
  name   = var.prefix
}
