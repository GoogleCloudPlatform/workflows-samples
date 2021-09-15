# datetime

A simple Cloud Function used in Workflow samples that returns the day of the week.

## Deploy

```sh
gcloud functions deploy datetime \
--trigger-http \
--entry-point getValue \
--runtime python37 \
--allow-unauthenticated
```

## Test

```
curl https://us-central1-workflowsample.cloudfunctions.net/datetime
```