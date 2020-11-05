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
