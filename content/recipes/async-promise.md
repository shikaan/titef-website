---
title: Async (with promises)
categories: ["recipes"]
weight: 3
---

# Code

Suppose you have an async function which returns a `Promise`.

```javascript
// test/fixtures/asyncSum.js

const asyncSum = (a, b) => {
    return new Promise((resolve, reject) => {
        const saneA = Number.parseInt(a, 10);
        const saneB = Number.parseInt(b, 10);

        if(Number.isNaN(saneA)) {
            reject('First argument is not number')
        }

        if(Number.isNaN(saneB)) {
            reject('Second argument is not number')
        }

        resolve(saneA + saneB);
    })
}
```

# Test (with CLI)

Then what you need to do is create a test file, for instance `sum-async.specs.js` (if
you're wondering what `spec` and `suite` do, please go [here](./sync))

```javascript
// test/sum-async.specs.js

const assert = require('assert');

const asyncSum = require('./fixtures/asyncSum');

suite('SumAsync', () => {
    // Use async keyword if calling an async function
    spec('should sum two numbers', async () => {
        const result = await asyncSum(2, 3);

        assert.deepEqual(result, 5);
    })

    spec('should throw', async () => {
        const fn = async () => {
            await asyncSum('foo', 2);
        }

        // And remember to use `throwsAsync` instead of `throws`, here
        await assert.throwsAsync(fn, /First argument is not number/);
    })

    xspec('ignored', () => {
        // whatever
    })
})

```

To launch the test you need to

```bash
$ titef test/sum-async.specs.js
```


> ## Remark
> **Titef** adds two methods to the otherwise awesome `assert` library. These are namely `throwsAsync` and `doesNotThrowAsync`.
> This means that if you want to use such methods, you can only run test via CLI.

# Test (without CLI)

Guess what? You don't need to use our CLI (unless you want special goodies, read [above remark](#remark))

```javascript
// test/sum-async.specs.js
const { suite, spec, xspec } = require('titef')

//... everything else is just like the example above
```

And then launching the test is as easy as

```bash
$ node test/sum-async.specs.js
```