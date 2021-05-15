#/bin/bash

echo "Validating filenames..."
workflowsFilePattern="*.workflows.yaml";

# Check all workflow files to see if the file pattern is good.
cd src
for path in $(find . -name '*.yaml'); do
  if [[ $path == $workflowsFilePattern ]]; then
    echo "✓ $path"
  else
    echo "✗ $path – doesn't match *.workflows.yaml"
    FAILED=true
  fi
done

# Fail CI if a path doesn't match.
if [[ $FAILED ]]; then exit 1; fi
