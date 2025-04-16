package test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/cloudinfo"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testaddons"
)

func setupAddonOptions(t *testing.T, prefix string) *testaddons.TestAddonOptions {
	options := testaddons.TestAddonsOptionsDefault(&testaddons.TestAddonOptions{
		Testing:              t,
		Prefix:               prefix,
		ResourceGroup:        resourceGroup,
		DeployTimeoutMinutes: 10,
	})

	return options
}

func TestRunBasicAddon(t *testing.T) {
	t.Parallel()

	options := setupAddonOptions(t, "mock-standard")
	options.AddonConfig = cloudinfo.NewAddonConfigTerraform(
		options.Prefix,
		"deploy-arch-ibm-mock-module-parent",
		"no-op-dependencies-parent",
		map[string]interface{}{
			// "prefix": options.Prefix,
		},
	)

	// // Sample config for dependency inputs
	// options.AddonConfig.Dependencies = []cloudinfo.AddonConfig{
	// 	{
	// 		OfferingFlavor: "no-op-dependencies-child",
	// 		OfferingID:     "mock-module-child",
	// 		Inputs: map[string]interface{}{
	// 			"prefix": options.Prefix,
	// 		},
	// 		Enabled: true,
	// 	},
	// }

	err := options.RunAddonTest()
	assert.Nil(t, err, "This should not have errored")
}
