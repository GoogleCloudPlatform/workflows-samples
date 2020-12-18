# Workflows Samples

This repository contains samples for [Cloud Workflows](https://cloud.google.com/workflows/docs).

## How to use these samples

All workflow samples are in the `src/` directory with the file format `*.workflows.{yaml/json}`.

The JSON and YAML files have equivalent behavior and functionality. Using JSON vs YAML is a matter of personal preference.

(The `.json` workflow files are generated from the YAML files.)

### Deploy a Workflow

To upload a workflow to Google Cloud, deploy the workflow,
replacing the `WORKFLOW` value with an ID of a workflow seen in the `src/` directory.

Example:

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.yaml
```

You can also deploy the JSON workflow similarly:

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.json
```

### Run a Workflow

After deploying a workflow, to run a workflow, use the `workflows execute` command with your workflow name like `myFirstWorkflow`:

```sh
gcloud beta workflows execute myFirstWorkflow
```

To see the results from the execution, run the command printed after executing the workflow. Example format:

```sh
gcloud beta workflows executions describe 7d8985dc-some-id-3e51d24f2576 --workflow myFirstWorkflow
```

#### Quickly Edit and Run Workflow

To run a workflow and imediately view the results, run a script like this, replacing `myFirstWorkflow` with your workflow name:

```sh
WORKFLOW=myFirstWorkflow
gcloud beta workflows deploy $WORKFLOW --source src/$WORKFLOW.workflows.yaml

EXE=$(basename $(
  gcloud beta workflows execute $WORKFLOW --format='value(name)')
) &&
  gcloud beta workflows executions describe $EXE --workflow $WORKFLOW --format='value(result)' > result.json
python -m json.tool result.json
rm result.json
```

## (Experimental) How to provide autocompletion to your workflow file

To provide autocompletion to your workflow file, in an IDE that supports JSON schema (like VS Code), name your file with one of these patterns:

- `workflows.json`
- `workflows.yaml`
- `workflows.yml`
- `*.workflows.json`
- `*.workflows.yaml`
- `*.workflows.yml`

The autocompletion uses the schema located at https://github.com/SchemaStore/schemastore/blob/master/src/schemas/json/workflows.json

If there are issues with the schema, please file an issue in this repo.

## How to create/edit a sample

To create a create/edit a sample, create or modify a **YAML** file in the `src/` directory.

Then, to generate the equivalent JSON file, run the `tojson.sh` script.