# Workflows Samples

This repository contains samples for [Cloud Workflows](https://cloud.google.com/workflows/docs).

## Overview

All workflow samples are in the `src/` directory with the file format `*.workflows.{yaml/json}`.

The JSON and YAML files have equivalent behavior and functionality. Using JSON vs YAML is a matter of personal preference.

(The `.json` workflow files are generated from the YAML files.)

## How to: Deploy a Workflow

To upload a workflow to Google Cloud, deploy the workflow,
replacing the `WORKFLOW` value with an ID of a workflow seen in the `src/` directory.

Deploy a workflow (`YAML`):

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.yaml
```

Deploy a workflow (`JSON`):

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.json
```

## How to: Deploy and Run a Workflow

To quickly deploy and run a workflow and imediately view the results,
run this script, replacing `myFirstWorkflow` with your workflow name:

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.yaml
gcloud beta workflows run $WORKFLOW --format='value(result)' | python -m json.tool
```

## (Experimental) How to provide autocompletion to your workflow file

To provide autocompletion to your workflow file, in an IDE that supports JSON schema (like VS Code), name your file with one of these patterns:

- `workflows.json`
- `workflows.yaml`
- `workflows.yml`
- `*.workflows.json`
- `*.workflows.yaml`
- `*.workflows.yml`

The autocompletion uses the schema from Schema Store:

- Hosted Schema: https://json.schemastore.org/workflows
- GitHub Source: https://github.com/SchemaStore/schemastore/blob/master/src/schemas/json/workflows.json

If there are issues with the schema, please file an issue in this repo.

## How to create/edit a sample

To create a create/edit a sample, create or modify a **YAML** file in the `src/` directory.

Then, to generate the equivalent JSON file, run the `tojson.sh` script.