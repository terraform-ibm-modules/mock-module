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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.58.1, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_group) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | List of resource group names to be created. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Resource Group Names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).
