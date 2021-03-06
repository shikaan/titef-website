---
title: Async (with callbacks)
categories: ["recipes"]
weight: 4
---

# Code

Suppose you have an async function with a callback (seriously?!). What we'll be doing
is simply using the `promisify` method in Node `util`library to transform that function
to a Promise based async function and then use what we already did in Recipe #2.

Let's take for example Node's `fs.readFile`.

Then what you need to do is create a test file, for instance `async-node.specs.js` (if
you'll be wondering what `spec` and `suite` do, please go [here](./sync); if you'll
be wondering how to use `async` go [here](./async-promise)).

# Test (with CLI)

```javascript
// test/async-node.specs.js

const { readFile } = require('fs');
const { join } = require('path');

/**
 * Please note: Node's folks made the world a better place adding this
 * `promisify` method to the `utils` lib. It will take a callback-based
 * method and transforms it into a Promise-based method.
 */
const { promisify } = require('util');

suite('AsyncNode', () => {
    // The dummy file contains only `dummy dummy dummy`
    const dummyPath = join(__dirname, 'fixtures', 'dummy');

    // `promisified` will behave just like a normal Promise-based method
    const promisified = promisify(readFile);

    spec('should read dummy file', async () => {
        const result = await promisified(dummyPath, 'utf-8');
        assert.deepStrictEqual(result, 'dummy dummy dummy');
    })

    xspec('ignore this', () => {})

    spec('should fail assertion', async () => {
        const result = await promisified(dummyPath, 'utf-8');
        assert.deepStrictEqual(result, 'dummy! dummy! dummy!');
    })

    spec('unhandled', async () => {
        const result = await promisified('not even a path', 'utf-8');
        assert.deepStrictEqual(result, 'dummy! dummy! dummy!');
    })

    spec('should throw', async () => {
        const fn = async () => {
            await promisified('not even a path', 'utf-8')
        };

        await assert.rejects(fn, Error);
    })
})

```

To launch the test you need to

```bash
$ titef test/async-node.specs.js
```

# Test (without CLI)

Again, you're not forced to use our CLI:

```javascript
// test/async-node.specs.js
const { suite, spec, xspec } = require('titef')

//... everything else is just like the example above
```

And then launching the test is as easy as

```bash
$ node test/async-node.specs.js
```