# Example

Modified from
<https://github.com/nodejs/node-addon-examples/blob/main/src/1-getting-started/1_hello_world/>

**NOTE**: Don't support nan because
<https://github.com/xmake-io/xmake-repo/issues/10#issuecomment-2587462047>
and node_version.h is missing.

## Example 1: *Hello world*

To get started let's make a small addon which is the C++ equivalent of
the following JavaScript code:

```js
module.exports.hello = function() { return 'world'; };
```
