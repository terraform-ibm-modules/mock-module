// Tests in this file are run in the PR pipeline
package test

import (
	"os/exec"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const basicExampleTerraformDir = "examples/basic"
const completeExampleTerraformDir = "examples/complete"
const daTerraformDir = "solutions/mock-da"

func setupOptions(t *testing.T, prefix string, dir string) *testhelper.TestOptions {
	options := testhelper.TestOptionsDefaultWithVars(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  dir,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
		IgnoreDestroys: testhelper.Exemptions{
			List: []string{
				"module.mock_module.terraform_data.hello_world",
			},
		},
	})
	return options
}

func TestRunBasicExample(t *testing.T) {
	t.Parallel()
	t.Skip()
	options := setupOptions(t, "mock-basic", basicExampleTerraformDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunCompleteExample(t *testing.T) {
	t.Parallel()
	t.Skip()
	options := setupOptions(t, "mock-com", completeExampleTerraformDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunUpgradeExample(t *testing.T) {
	// temporary skip to avoid error (Inconsistent dependency lock file)
	t.Skip()
	t.Parallel()

	options := setupOptions(t, "mock-da-upg", daTerraformDir)

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func TestGitBranch(t *testing.T) {

	cmd1 := exec.Command("git", "symbolic-ref", "--short", "HEAD")
	output1, _ := cmd1.Output()
	t.Logf("Git branch from symbolic-ref: %s", output1)

	cmd2 := exec.Command("git", "status", "--branch", "--porcelain")
	output2, _ := cmd2.Output()
	t.Logf("Git branch from status: %s", output2)

	cmd3 := exec.Command("git", "rev-parse", "--abbrev-ref", "HEAD")
	output3, _ := cmd3.Output()
	t.Logf("Git branch from rev-parse: %s", output3)
}
