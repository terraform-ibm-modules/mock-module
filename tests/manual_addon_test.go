package test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/cloudinfo"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testaddons"
)

func setupAddonOptions(t *testing.T, prefix string, dir string) *testaddons.TestAddonOptions {
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

	options := setupAddonOptions(t, "mock-standard", basicExampleTerraformDir)
	options.AddonConfig.OfferingFlavor = "standard"
	options.AddonConfig.OfferingName = "deploy-arch-ibm-mock-module"
	options.AddonConfig.OfferingInstallKind = *cloudinfo.NewInstallKindTerraform()
	options.AddonConfig.Inputs = map[string]interface{}{
		"region": "us-east",
		"prefix": options.Prefix,
	}

	err := options.RunAddonTest()
	assert.Nil(t, err, "This should not have errored")
}
