# Cloud Workflows JSON Schema

JSON Schema is a declarative language that allows you to annotate and validate JSON and YAML documents. Learn more at https://json-schema.org/.

The schema provides syntax support during development through IDE autocompletion and during CI through syntax validation. The schema will NOT catch all errors as the Workflows API does additional YAML/JSON parsing.

Hosted:
*   [SchemaStore.org](https://www.schemastore.org/json/)
*   [Cloud Code](https://cloud.google.com/code)

## IDE Autocompletion

To use the schema for syntax autocompletion, you must use an IDE or IDE plugin with JSON or YAML Language Server. Not using VSCode or IntelliJ? See a [list of additional editors](https://json-schema.org/implementations.html#editors).

* Choose an editor:

| Editor | Plugin or Built-in Feature | Description |
| --- | - | -|
| VSCode | [Cloud Code](https://cloud.google.com/code) | Plugin for Google Cloud integrations which allows for *automatic* use of schemas from the SchemaStore.org and offline Google Cloud schemas for YAML support.|
| VSCode | [YAML by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | Plugin for YAML support which allows for *automatic* use of schemas from the SchemaStore.org for YAML support. |
| VSCode | Built-in [JSON schemas](https://code.visualstudio.com/docs/languages/json#_json-schemas-and-settings) | Set up VSCode to use a local or Schema Store schema for JSON support. |
| IntelliJ | [Cloud Code](https://cloud.google.com/code) | Plugin for Google Cloud integrations which allows for *automatic* use of schemas from the SchemaStore.org and offline Google Cloud schemas for YAML support. |
| IntelliJ | Built-in [JSON schemas](https://www.jetbrains.com/help/idea/json.html#ws_json_using_schemas) | Set up IntelliJ to use a local or SchemaStore.org schema for JSON support. |

* Name your Workflows file with one of these patterns:

    - `workflows.json`
    - `workflows.yaml`
    - `workflows.yml`
    - `*.workflows.json`
    - `*.workflows.yaml`
    - `*.workflows.yml`

* Use the editor's or plugin's key binding, like `ctrl + space`, to autocomplete syntax.

#### Add Local Schema Updates

To use a local copy of the JSON schema, update user settings in VSCode `settings.json` (see below) or find [IntelliJ instructions](https://www.jetbrains.com/help/idea/json.html#ws_json_schema_add_custom):

* Cloud Code
```json
{
    ...
    "cloudcode.yaml.schemas": {
        "file:///PATH/TO/SCHEMA/workflows.json": [
            "*.workflows.yaml",
            "workflows.yaml"
        ]
    },
    ...
}
```

* YAML by RedHat
```json
{
    ...
    "yaml.schemas": {
        "file:///PATH/TO/SCHEMA/workflows.json": [
            "*.workflows.yaml",
            "workflows.yaml"
        ]
    },
    ...
}
```

* VSCode Built-in JSON Support
```json
{
    ...
    "json.schemas": [
        {
            "description": "Local Workflows Schema",
            "fileMatch": [
                "*.workflows.json"
            ],
            "url": "./PATH/TO/SCHEMA/workflows.json"
        },
        {
            "description": "SchemaStore.org",
            "fileMatch": [
                "workflows.json",
                "*.workflows.json",
            ],
            "url": "https://json.schemastore.org/workflows.json"
          }
    ],
    ...
}
```

## Workflows Syntax Validation

This can be use for both JSON and YAML Cloud Workflows files.

* Install Node.js

* Install [`ajv-cli`](https://www.npmjs.com/package/ajv-cli) tool:

```sh
npm install -g ajv-cli ajv-formats
```

Note: `ajv-formats` is needed for draft2019+

* Validate Workflows syntax:

```sh
ajv validate -c ajv-formats --spec=draft2019 \
    -s <PATH_TO_REPO>/jsonschema/workflows.json \
    -d <PATH_TO_FILE>
```

### JSON Schema Syntax Validation

Ensure that the JSON schema is valid:

```sh
ajv compile -c ajv-formats --spec=draft2019 -s <PATH_TO_REPO>/jsonschema/workflows.json
```

### Other Tools

* [MegaLinter](https://megalinter.io/latest/) has [YAML](https://megalinter.io/latest/descriptors/yaml_v8r/) and [JSON](https://megalinter.io/latest/descriptors/json_v8r/)
schema validation and linting capabilities.
* [JSON Schema Tool List](https://json-schema.org/implementations.html)