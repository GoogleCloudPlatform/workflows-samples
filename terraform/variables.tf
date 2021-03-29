variable "gcp_region" {
  description = "Region for GCP"
  type        = string
}
variable "gcp_project" {
  description = "GCP project name"
  type        = string
}

variable "gcp_service_account" {
  description = "GCP service account in 'projects/{project_id}/serviceAccounts/{account}' format"
  type        = string
}

variable "workflow_name" {
  description = "Workflow name"
  type        = string
}

variable "description" {
  description = "Workflow description"
  type        = string
  default     = "Deployed using terraform"
}

