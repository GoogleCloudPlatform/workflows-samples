output "gcp-workflow-id" {
  value = google_workflows_workflow.example.id
}

output "gcp-workflow-state" {
  value = google_workflows_workflow.example.state
}

output "gcp-workflow-revision-id" {
  value = google_workflows_workflow.example.revision_id
}
