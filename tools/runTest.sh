runTest() {
    src=$1
    tmp_name=${src:6}  # remove src/
    tmp_name=${tmp_name/connectors\//}  # remove connectors/ if present
    workflow_name=${tmp_name//./-}-$SHORT_SHA  # convert . to -

    echo "Deploying $workflow_name with source: $src"

    test="$(gcloud workflows deploy $workflow_name \
        --source $src \
        --location $_REGION \
        --quiet 2>&1)"

    if [[ $? -ne 0 ]]; then
        echo "$workflow_name (src: $src) failed!" >> /workspace/failures.txt
        echo $test >> /workspace/failures.txt
    fi

    gcloud workflows delete $workflow_name \
        --location $_REGION \
        --quiet
}