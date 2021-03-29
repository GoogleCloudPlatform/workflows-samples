provider "google" {
  credentials = file("../../terraform/uri-test-key.json")
  project     = "uri-test"
  region      = "us-east1"
  version     = "~> 3.59.0"
}

terraform {
  backend "gcs" {
    bucket = "uri-test-tf-state"
    prefix = "uri-test-tf-state/workflows"
  }
}