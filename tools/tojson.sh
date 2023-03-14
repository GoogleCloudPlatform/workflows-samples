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
cd src
# rm -rf **/*.json
for path in $(find . -name '*.yaml'); do
  yaml2json $path --save --pretty
done
cd ..
echo 'Done!'