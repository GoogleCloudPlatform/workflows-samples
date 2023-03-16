# Workflows Samples

This repository contains samples for [Cloud Workflows](https://cloud.google.com/workflows/docs).

## Overview

All workflow samples are in the `src/` directory with the file format `*.workflows.{yaml/json}`.

The JSON and YAML files have equivalent behavior and functionality. Using JSON vs YAML is a matter of personal preference.

(The `.json` workflow files are generated from the YAML files.)

## How to: Deploy and Run a Workflow

To quickly deploy and run a workflow and immediately view the results,
run this script, replacing `myFirstWorkflow` with your workflow name:

```sh
WORKFLOW=myFirstWorkflow
gcloud workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.yaml
gcloud workflows run $WORKFLOW --format='value(result)'
```

## How to: Syntax Autocompletion

Learn how to use the JSON Schema for [Syntax Autocompletion](./jsonschema/README.md#IDE-Autocompletion).