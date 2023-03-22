# How to Contribute

We'd love to accept your patches and contributions to this project. There are
just a few small guidelines you need to follow.

## Contributor License Agreement

Contributions to this project must be accompanied by a Contributor License
Agreement. You (or your employer) retain the copyright to your contribution;
this simply gives us permission to use and redistribute your contributions as
part of the project. Head over to <https://cla.developers.google.com/> to see
your current agreements on file or to sign a new one.

You generally only need to submit a CLA once, so if you've already submitted one
(even if it was for a different project), you probably don't need to do it
again.

## Code Reviews

All submissions, including submissions by project members, require review. We
use GitHub pull requests for this purpose. Consult
[GitHub Help](https://help.github.com/articles/about-pull-requests/) for more
information on using pull requests.

## Samples

## Generating JSON

To generate JSON files from YAML, run the following script:

```
./tojson.sh
```

## JSON Schema


JSON Schema is a declarative language that allows you to annotate and validate JSON and YAML documents. Learn more at https://json-schema.org/.

The goal is to provide customers with syntax support during development through IDE autocompletion and during CI through syntax validation. The schema will NOT catch all errors as the Workflows API does additional YAML/JSON parsing.

### Main JSON Schema

A Workflow can be either:

* Main with optional subworkflow
    * Params
    * Steps
* Set of steps

### Definitions (Current Feature Coverage)
The JSON Schema specification also allows us to define auxiliary schema in order to be reused and combined later on. Learn more at https://cswr.github.io/JsonSchema/spec/definitions_references/ and https://json-schema.org/understanding-json-schema/structuring.html.

* Subworkflow
    * Params
    * Steps
* stepArray
    * Array of stepRef
* Step
    * References to definitions
* Assign
* Call
* Args
    * Url
    * Method
    * Headers
    * Body
    * Query
    * Auth
        * Type
        * Scope
        * Scopes
        * Audience
    * Timeout
    * Connector_params
        * Timeout
        * Polling_policy
            * Initial_delay
            * Multiplier
            * Max_delay
        * Skip_polling
        * Scopes
    * Callback 
* Result
* Next
* Return
* For
    * Value
    * Index
    * In
    * Range
    * Steps
* Parallel
    * Exception_policy
    * Shared
    * Concurrency_limit
    * Branches
    * For
* Branches
* Switch
* Condition
    * Condition or stepRef
* Raise
    * Code
    * Message
* Try
* Except
    * As or steps
* Retry
    * Predicate
    * Max_retries
    * Backoff
        * Initial_delay
        * Multiplier
        * Max_delay
* Scopes

#### Best Practices

* Use the lowest possible schema draft needed, preferably Draft v4, to ensure interoperability with as many supported editors, IDEs and parsers as possible.
* Always use `description`, `type`, `additionalProperties`.
    * Always set `additionalProperties` to `false` until documentation permits additional properties explicitly. That tool the JSON schema is created for can be changed in the future to allow wrong extra properties.
* Always use `minLength`/`maxLength`/`pattern`/etc for property values.
* Always be consistent across your schema: order properties and describe in the one style.

Find more best practices defined by the [SchemaStore community](https://github.com/SchemaStore/schemastore/blob/master/CONTRIBUTING.md#best-practices).
