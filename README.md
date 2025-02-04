<!-- Update the title to match the module name and add a description -->
# Mock Module (NOT FOR GENERAL CONSUMPTION)

[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/mock-module?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/mock-module/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)


:warning: This is a mock module for testing purposes and not for general consumption.
<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [mock-module](#mock-module)
* [Examples](./examples)
    * [Basic example](./examples/basic)
    * [Complete example](./examples/complete)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->

<!-- This heading should always match the name of the root level module (aka the repo name) -->
## mock-module

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
module "mock_module" {
  # Replace "X.X.X" with a release version to lock into a specific release
  source            = "git::https://github.com/terraform-ibm-modules/mock-module.git?ref=X.X.X"
  name              = "mock"
  resource_group_id = "XXXXXXXXXXXXXXXX"
  tags              = var.resource_tags
}
```

### Required IAM access policies

No permissions are needed to run this module.

<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4, < 5.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [terraform_data.hello_world](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [tls_private_key.tls_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eso_chart_version"></a> [eso\_chart\_version](#input\_eso\_chart\_version) | The version of the External Secrets Operator Helm chart. | `string` | `"0.12.0"` | no |
| <a name="input_eso_image_digest"></a> [eso\_image\_digest](#input\_eso\_image\_digest) | The image digest in the format sha256:xxxxx... for ESO image to deploy. If not provided, a default value will be used. | `string` | `"v0.11.0-ubi@sha256:41b6f0118fe9f3c57a20e33d42cb6006aaeb33561411db3c42a468201dfeae63"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the SSH Key. | `string` | n/a | yes |
| <a name="input_reloader_chart_version"></a> [reloader\_chart\_version](#input\_reloader\_chart\_version) | The version of the Reloader Helm chart. | `string` | `"1.2.0"` | no |
| <a name="input_reloader_image_digest"></a> [reloader\_image\_digest](#input\_reloader\_image\_digest) | The image digest in the format sha256:xxxxx... the reloader image to deploy. If not provided, a default value will be used. | `string` | `"v1.2.0-ubi@sha256:10253ddd79b8d681287a0122b379d41a026d3731e2bfac6c7b60b86e2dd57111"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group. If not specified, Default resource group used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the SSH Key. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_eso_chart_version"></a> [eso\_chart\_version](#output\_eso\_chart\_version) | eso\_chart\_version |
| <a name="output_eso_image_digest"></a> [eso\_image\_digest](#output\_eso\_image\_digest) | eso\_image\_digest |
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | SSH key Fingerprint info |
| <a name="output_reloader_chart_version"></a> [reloader\_chart\_version](#output\_reloader\_chart\_version) | reloader\_chart\_version |
| <a name="output_reloader_image_digest"></a> [reloader\_image\_digest](#output\_reloader\_image\_digest) | reloader\_image\_digest |
| <a name="output_ssh_key_id"></a> [ssh\_key\_id](#output\_ssh\_key\_id) | The ID of the ssh key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).
