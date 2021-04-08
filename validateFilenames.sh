#/bin/bash

echo "Validating filenames..."
workflowsFilePattern="*.workflows.yaml";

cd src
for path in $(find . -name '*.yaml'); do
  [[ $path == $workflowsFilePattern ]] &&
    echo "File is fine!" ||
    echo "$path doesn't match *.workflows.yaml" &&
    exit
done