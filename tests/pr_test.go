// Tests in this file are run in the PR pipeline
package test

import (
	"log"
	"net/url"
	"os/exec"
	"strings"
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
	t.Skip()
	t.Parallel()

	options := setupOptions(t, "mock-basic", basicExampleTerraformDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunCompleteExample(t *testing.T) {
	t.Skip()
	t.Parallel()

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

func TestOriginURL(t *testing.T) {

	cmd_commit_sha := exec.Command("git", "rev-parse", "HEAD")
	output_commit_sha, _ := cmd_commit_sha.Output()

	origin_base := getOriginURL()

	if !strings.HasPrefix(origin_base, "http") {
		origin_base = strings.Split(origin_base, "@")[1]
		origin_base = strings.Replace(origin_base, ":", "/", 1)
		origin_base = "https://" + origin_base
		origin_base = strings.TrimSuffix(origin_base, ".git")
	}

	origin_url, _ := url.JoinPath(origin_base, "tree", strings.TrimSpace(string(output_commit_sha)))

	t.Log("Test URL would be: " + origin_url)
}

// copied from wrapper temporarily
func getOriginURL() string {
	// Determine the URL of the upstream remote (usually "origin")
	repo := ""

	// If there's no "upstream" remote, fall back to "origin"
	cmd := exec.Command("git", "remote", "get-url", "origin")
	output, err := cmd.Output()
	if err != nil {
		log.Println("Unable to determine origin URL")
		log.Println(err)
		return ""
	}
	repo = strings.TrimSpace(string(output))

	return repo
}
