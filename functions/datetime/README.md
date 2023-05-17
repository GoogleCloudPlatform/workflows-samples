# datetime

A simple Cloud Function used in Workflow samples that returns the day of the week.

## Deploy

```sh
gcloud functions deploy datetime \
    --gen2 \
    --trigger-http \
    --entry-point getValue \
    --runtime python311 \
    --region us-central1
    --allow-unauthenticated
```

## Test

Get function URL:
```sh
gcloud functions describe datetime \
    --gen2 \
    --region us-central1 \
    --format="value(serviceConfig.uri)"

# https://datetime-HASH-uc.a.run.app
```
