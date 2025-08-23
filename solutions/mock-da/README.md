# Complete example

An basic example showing how to consume the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.81.1 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cos"></a> [cos](#module\_cos) | terraform-ibm-modules/cos/ibm | 10.2.6 |
| <a name="module_mock_module"></a> [mock\_module](#module\_mock\_module) | ../.. | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform-ibm-modules/resource-group/ibm | 1.3.0 |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API Key | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to append to all resources created by this example | `string` | `"mock"` | no |
| <a name="input_provider_visibility"></a> [provider\_visibility](#input\_provider\_visibility) | Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints). | `string` | `"private"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to provision all resources created by this example | `string` | `"us-south"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | An existing resource group name to use for this example, if unset a new resource group will be created | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to be added to created resources | `list(string)` | `[]` | no |
| <a name="input_testing"></a> [testing](#input\_testing) | Test variable to test setting list of strings to null | `list(string)` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | SSH key Fingerprint info |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Resource Group Name |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource Group ID |
| <a name="output_ssh_key_id"></a> [ssh\_key\_id](#output\_ssh\_key\_id) | The ID of the ssh key |
| <a name="output_test"></a> [test](#output\_test) | test |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
