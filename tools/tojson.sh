#/bin/bash
# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Converts YAML files to JSON files
# Requires `npm install -g yamljs`
# https://www.npmjs.com/package/yamljs

echo "Please enter the yaml file name you want to convert to json and include a relative path from root."
echo "Example: src/http_get.workflows.yaml"
echo "Enter 'all' if you want to convert all yaml files."
read -p 'File: ' file
file=$(echo "$file" | tr '[:upper:]' '[:lower:]')

if ! command -v yaml2json &> /dev/null
then
    echo "ERROR: yaml2json could not be found"
    echo "Install yaml2json with:"
    echo ""
    echo "npm install -g yamljs"
    echo ""
    exit
fi

# Loop through all yaml files or a single specified file, then convert to json.
if [[ $file =  "all" ]]
then
  cd src
  for path in $(find . -name '*.yaml'); do
    yaml2json $path --save --pretty
  done
  cd ..
else
  yaml2json $file --save --pretty
fi

echo 'Done!'
