resource "google_workflows_workflow" "example" {
  name            = var.workflow_name
  region          = var.gcp_region
  description     = var.description
  service_account = var.gcp_service_account
  #   service_account = "projects/uri-test/serviceAccounts/workflows-sa@uri-test.iam.gserviceaccount.com"
  project         = var.gcp_project
  source_contents = <<-EOF
  # Sample workflow. Note the double $ sign within the expressions. This will be deployed as a single $ sign
  # Sample input: {"resource":{"machineType":"projects/uri-test/zones/us-central1-a/machineTypes/e2-medium","name":"instance-500","disks":[{"boot":true,"initializeParams":{"sourceImage":"projects/debian-cloud/global/images/debian-10-buster-v20210217","diskType":"projects/uri-test/zones/us-central1-a/diskTypes/pd-balanced","diskSizeGb":10}}],"networkInterfaces":[{"subnetwork":"projects/uri-test/regions/us-central1/subnetworks/default"}],"serviceAccounts":[{"email":"960394617171-compute@developer.gserviceaccount.com","scopes":["https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append"]}]}}
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