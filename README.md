# Workflows Samples

This repository contains samples for [Cloud Workflows](https://cloud.google.com/workflows/docs).

## How to use these samples

### Deploy a Workflow

To create a workflow, 

```sh
gcloud beta workflows deploy myWorkflow.yaml
```

### Run a Workflow

To run a workflow, use the `workflows execute` command with your workflow like `myWorkflow`:

```sh
gcloud beta workflows execute myWorkflow
```

To run a workflow and imediately view the results, run a script like this, replacing `myWorkflow` with your workflow name:

```sh
EXE=$(basename $(
  gcloud beta workflows execute myWorkflow --format='value(name)')
) &&
  gcloud beta workflows executions describe $EXE --workflow myWorkflow --format='value(result)' > result.json
python -m json.tool result.json > out.json
cat out.json
```

## How to provide autocompletion to your workflow file

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

To create a create/edit a sample, create or modify a YAML file in the `src` directory.

To generate the equivalent JSON file, run the `tojson.sh` script.