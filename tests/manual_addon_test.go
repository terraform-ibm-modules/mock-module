package test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testaddons"
)

func setupAddonOptions(t *testing.T, prefix string, dir string) *testaddons.TestAddonOptions {
	options := testaddons.TestAddonsOptionsDefault(&testaddons.TestAddonOptions{
		Testing:       t,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
	})

	return options
}

func TestRunBasicAddon(t *testing.T) {
	t.Parallel()

	options := setupAddonOptions(t, "mock-basic", basicExampleTerraformDir)

	err := options.RunAddonTest()
	assert.Nil(t, err, "This should not have errored")
}
