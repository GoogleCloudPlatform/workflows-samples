#/bin/bash

# Converts YAML files to JSON files
# Requires `npm install -g yamljs`
# https://www.npmjs.com/package/yamljs

if ! command -v yaml2json &> /dev/null
then
    echo "ERROR: yaml2json could not be found"
    echo "Install yaml2json with:"
    echo ""
    echo "npm install -g yamljs"
    echo ""
    exit
fi

# Loop through all yaml files, convert to json
rm -rf **/*.json
cd src
for path in $(find . -name '*.yaml'); do
  yaml2json $path --save --pretty
done
cd ..
echo 'Done!'