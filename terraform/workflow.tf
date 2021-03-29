resource "google_workflows_workflow" "example" {
  name            = var.workflow_name
  region          = var.gcp_region
  description     = var.description
  service_account = var.gcp_service_account
  #   service_account = "projects/uri-test/serviceAccounts/workflows-sa@uri-test.iam.gserviceaccount.com"
  project         = var.gcp_project
  source_contents = <<-EOF
  # Sample workflow. Note the double $ sign within the expressions. This will be deployed as a single $ sign
  main:
    params: [args]
    steps:
    - initVariables:
        assign:
            - project: $${sys.get_env("GOOGLE_CLOUD_PROJECT_ID")}
            - zone: "us-central1-a"
            - body: $${args.resource}
    - Create Instance:
            call: googleapis.compute.v1.instances.insert
            args:
                project: $${project}
                body: $${body}
                zone: $${zone}
            result: CreateInstanceResult
    - last:
        return: $${CreateInstanceResult}
EOF
}