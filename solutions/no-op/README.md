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
| <a name="input_no-op-nul-bool"></a> [no-op-nul-bool](#input\_no-op-nul-bool) | No-op variable to test setting a bool to null | `bool` | `null` | no |
| <a name="input_no-op-nul-list"></a> [no-op-nul-list](#input\_no-op-nul-list) | No-op variable to test setting a list to null | `list(string)` | `null` | no |
| <a name="input_no-op-nul-map"></a> [no-op-nul-map](#input\_no-op-nul-map) | No-op variable to test setting a map to null | `map(string)` | `null` | no |
| <a name="input_no-op-nul-number"></a> [no-op-nul-number](#input\_no-op-nul-number) | No-op variable to test setting a number to null | `number` | `null` | no |
| <a name="input_no-op-nul-object"></a> [no-op-nul-object](#input\_no-op-nul-object) | No-op variable to test setting an object to null | <pre>object({<br/>    name = string<br/>    age  = number<br/>  })</pre> | `null` | no |
| <a name="input_no-op-nul-set"></a> [no-op-nul-set](#input\_no-op-nul-set) | No-op variable to test setting a set to null | `set(string)` | `null` | no |
| <a name="input_no-op-nul-string"></a> [no-op-nul-string](#input\_no-op-nul-string) | No-op variable to test setting a string to null | `string` | `null` | no |
| <a name="input_no-op-nul-tuple"></a> [no-op-nul-tuple](#input\_no-op-nul-tuple) | No-op variable to test setting a tuple to null | `tuple([string, number])` | `null` | no |
| <a name="input_notset-bool"></a> [notset-bool](#input\_notset-bool) | No-op variable to test not setting a bool | `bool` | n/a | yes |
| <a name="input_notset-list"></a> [notset-list](#input\_notset-list) | No-op variable to test not setting a list | `list(string)` | n/a | yes |
| <a name="input_notset-map"></a> [notset-map](#input\_notset-map) | No-op variable to test not setting a map | `map(string)` | n/a | yes |
| <a name="input_notset-number"></a> [notset-number](#input\_notset-number) | No-op variable to test not setting a number | `number` | n/a | yes |
| <a name="input_notset-object"></a> [notset-object](#input\_notset-object) | No-op variable to test not setting an object | <pre>object({<br/>    name = string<br/>    age  = number<br/>  })</pre> | n/a | yes |
| <a name="input_notset-set"></a> [notset-set](#input\_notset-set) | No-op variable to test not setting a set | `set(string)` | n/a | yes |
| <a name="input_notset-string"></a> [notset-string](#input\_notset-string) | No-op variable to test not setting a string | `string` | n/a | yes |
| <a name="input_notset-tuple"></a> [notset-tuple](#input\_notset-tuple) | No-op variable to test not setting a tuple | `tuple([string, number])` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to append to all resources created by this example | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to provision all resources created by this example | `string` | `"us-south"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_ssh_key_id"></a> [module\_ssh\_key\_id](#output\_module\_ssh\_key\_id) | The ssh\_key\_id from the module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
