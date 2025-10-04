// Tests in this file are run in the PR pipeline
package test

import (
	"fmt"
	"log"
	"net/url"
	"os"
	"os/exec"
	"strings"
	"testing"

	"github.com/IBM/go-sdk-core/v5/core"
	schematics "github.com/IBM/schematics-go-sdk/schematicsv1"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/common"
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

func TestBetterPullURL(t *testing.T) {

	cmd_commit_sha := exec.Command("git", "rev-parse", "HEAD")
	output_commit_sha, _ := cmd_commit_sha.Output()
	t.Log("Commit SHA: " + strings.TrimSpace(string(output_commit_sha)))

	// get a parsed url from origin
	urlObj, originalUrl, parseErr := getParsedURL()
	require.NoError(t, parseErr)

	t.Log("The original Origin URL: " + originalUrl)
	t.Log("Scheme: " + urlObj.Scheme)
	t.Log("Opaque: " + urlObj.Opaque)
	t.Log("User: " + urlObj.User.String())
	t.Log("Host: " + urlObj.Host)
	t.Log("Path: " + urlObj.Path)

	// now build a new url based on original but with changes
	newUrl := new(url.URL)
	newUrl.Scheme = "https"
	newUrl.Host = urlObj.Hostname()
	newPath, pathErr := url.JoinPath(strings.TrimSuffix(urlObj.Path, ".git"), "tree", strings.TrimSpace(string(output_commit_sha)))
	require.NoError(t, pathErr)
	newUrl.Path = newPath

	t.Log("Final URL to PR: " + newUrl.String())

	// create a workspace
	wsUrl := new(url.URL)
	wsUrl.Scheme = "https"
	wsUrl.Host = urlObj.Hostname()
	//wsUrl.Path = strings.TrimSuffix(urlObj.Path, ".git")
	wsUrl.Path, _ = url.JoinPath(strings.TrimSuffix(urlObj.Path, ".git"), "archive", fmt.Sprintf("%s.tar.gz", strings.TrimSpace(string(output_commit_sha))))

	t.Log("Setting workspace URL to: " + wsUrl.String())

	newWs, wsSetupErr := setupSchematicsWorkspace(wsUrl.String(), strings.TrimSpace(string(output_commit_sha)))
	require.NoError(t, wsSetupErr)

	t.Log("Workspace Created!: " + *newWs.ID)
}

func getParsedURL() (*url.URL, string, error) {
	originalUrl := getOriginURL()
	if len(originalUrl) == 0 {
		return nil, originalUrl, fmt.Errorf("Empty Origin URL")
	}

	parsedUrl, parseErr := url.Parse(originalUrl)
	if parseErr != nil {
		return nil, originalUrl, fmt.Errorf("Could not parse url '%s': %w", originalUrl, parseErr)
	}

	return parsedUrl, originalUrl, nil
}

func setupSchematicsWorkspace(repoURL string, prSHA string) (*schematics.WorkspaceResponse, error) {

	apikey := os.Getenv("TF_VAR_ibmcloud_api_key")
	schematicsClient, schematicsErr := schematics.NewSchematicsV1(&schematics.SchematicsV1Options{
		Authenticator: &core.IamAuthenticator{
			ApiKey: apikey,
		},
	})
	if schematicsErr != nil {
		return nil, schematicsErr
	}

	// create env and input vars template
	templateModel := &schematics.TemplateSourceDataRequest{
		//Folder: core.StringPtr(basicExampleTerraformDir),
		Type: core.StringPtr("terraform_v1.9"),
		//EnvValues:         envValues,
		//EnvValuesMetadata: envMetadata,
		//Compact: core.BoolPtr(false),
	}

	templateRepo := &schematics.TemplateRepoRequest{
		//RepoURL: core.StringPtr(repoURL),
		URL: core.StringPtr(repoURL),
		//RepoShaValue: core.StringPtr(prSHA),
		//Branch: core.StringPtr(prSHA),
	}

	createWorkspaceOptions := &schematics.CreateWorkspaceOptions{
		Description:   core.StringPtr("Test for mock using SHA"),
		Name:          core.StringPtr("todd-mock-sha-test-" + common.UniqueId()),
		TemplateData:  []schematics.TemplateSourceDataRequest{*templateModel},
		Type:          []string{"terraform_v1.9"},
		Location:      core.StringPtr("us-south"),
		ResourceGroup: core.StringPtr("Default"),
		TemplateRepo:  templateRepo,
	}

	var workspace *schematics.WorkspaceResponse
	var workspaceErr error
	workspace, _, workspaceErr = schematicsClient.CreateWorkspace(createWorkspaceOptions)
	if workspaceErr != nil {
		return nil, workspaceErr
	}

	return workspace, nil
}
