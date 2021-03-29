# terraform-workflows
A sample of deploying a workflow using terraform. Please see [terraform registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workflows_workflow) for more information.

## What will be created?
Running this sample will create a workflow to created a GCE instance. the properties of the instance are described in the sample input file.

## Configuration
1. [Configure GCP provider](https://learn.hashicorp.com/terraform/gcp/build#configuration). <br/>
    1.1 See connections.tf for a sample file containing config information for GCP. <br/>
    1.2 You can use the json file downloaded from GCP as is. <br/>
    1.3 Point the "credentials" property in connections.tf to the the json file downloaded from GCP. <br/>
2. Replace the values in a terraform.tfvars files with your values. See table below for details.
3. If you would like to save the Terraform state remotely (recommended), create a bucket in GCS and configure terraform to point to the bucket. (see connections.tf for an example). Otherwise, comment out the 'terraform' section in the connections.tf file. The state will be saved locally.

## Input
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp_region | GCP region where the workflow will be created. | string | "us-central1" | yes |
| gcp_project | GCP project name where the workflow will be created. | string | "uri-test" | yes |
| gcp_service_account | GCP service account in 'projects/{project_id}/serviceAccounts/{account}' format | string | "projects/uri-test/serviceAccounts/workflows-sa@uri-test.iam.gserviceaccount.com" | yes |
| workflow_name | workflow name | string | "terraform-workflow" | yes |
| description | workflow description. | string | "Deployed using terraform" | yes |

## Usage
### Create workflow
Run starter.sh
### Cleanup
Run destroy.sh