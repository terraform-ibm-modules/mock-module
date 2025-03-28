# Complete example

An basic example showing how to consume the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mock_module"></a> [mock\_module](#module\_mock\_module) | ../.. | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to append to all resources created by this example | `string` | `"mock-no-op"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_ssh_key_id"></a> [module\_ssh\_key\_id](#output\_module\_ssh\_key\_id) | The ssh\_key\_id from the module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
