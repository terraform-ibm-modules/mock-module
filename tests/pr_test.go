// Tests in this file are run in the PR pipeline
package test

import (
	"os"
	"os/exec"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testschematic"
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
	t.Parallel()
	t.Skip()
	options := setupOptions(t, "mock-da-upg", daTerraformDir)

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func TestGitBranch(t *testing.T) {
	t.Skip()
	cmd1 := exec.Command("git", "symbolic-ref", "--short", "HEAD")
	output1, _ := cmd1.Output()
	t.Logf("Git branch from symbolic-ref: %s", output1)

	cmd2 := exec.Command("git", "status", "--branch", "--porcelain")
	output2, _ := cmd2.Output()
	t.Logf("Git branch from status: %s", output2)

	cmd3 := exec.Command("git", "rev-parse", "--abbrev-ref", "HEAD")
	output3, _ := cmd3.Output()
	t.Logf("Git branch from rev-parse: %s", output3)

	envHead := os.Getenv("GITHUB_HEAD_REF")
	envBase := os.Getenv("GITHUB_BASE_REF")

	t.Logf("Git branch from env: %s", envHead)
	t.Logf("Git base from env: %s", envBase)
}

func TestRunSchematicsUpgradePass(t *testing.T) {
	t.Parallel()

	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing:                    t,
		Prefix:                     "mock-schupg",
		Region:                     "us-south",
		TemplateFolder:             basicExampleTerraformDir,
		SkipTestTearDown:           false,
		ResourceGroup:              resourceGroup,
		CheckApplyResultForUpgrade: true,
		IgnoreDestroys: testhelper.Exemptions{
			List: []string{
				"module.mock_module.terraform_data.hello_world",
			},
		},
	})

	options.TarIncludePatterns = []string{
		"*.tf",
		basicExampleTerraformDir + "/*.tf",
	}

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "region", Value: options.Region, DataType: "string"},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
	}

	err := options.RunSchematicUpgradeTest()
	assert.NoError(t, err)
}

func TestRunSchematicsUpgradeFail(t *testing.T) {
	t.Parallel()
	t.Skip()
	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing:                    t,
		Prefix:                     "mock-supgf",
		Region:                     "us-south",
		TemplateFolder:             basicExampleTerraformDir,
		SkipTestTearDown:           false,
		ResourceGroup:              resourceGroup,
		CheckApplyResultForUpgrade: true,
		IgnoreDestroys: testhelper.Exemptions{
			List: []string{},
		},
	})

	options.TarIncludePatterns = []string{
		"*.tf",
		basicExampleTerraformDir + "/*.tf",
	}

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "region", Value: options.Region, DataType: "string"},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
	}

	err := options.RunSchematicUpgradeTest()
	assert.NoError(t, err)
}

func TestRunOldUpgradeExamplePass(t *testing.T) {
	// temporary skip to avoid error (Inconsistent dependency lock file)
	t.Parallel()
	t.Skip()
	options := setupOptions(t, "mock-oupg", basicExampleTerraformDir)

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func TestRunOldUpgradeExampleFail(t *testing.T) {
	// temporary skip to avoid error (Inconsistent dependency lock file)
	t.Parallel()
	t.Skip()
	options := setupOptions(t, "mock-oupgf", basicExampleTerraformDir)

	// get rid of exception so it fails
	options.IgnoreDestroys = testhelper.Exemptions{
		List: []string{},
	}

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}
