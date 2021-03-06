---
title: setInterval, setTimeout
categories: ["recipes"]
weight: 4
---

If for some reasons you need to use `setTimeout` or `setInterval` in your tests, you can do
that pretending they're returning a `Promise`. **Titef** under the hoods overrides this two
methods replacing them with a Promise-based version which can be used as you did with old ones.

# Test (with CLI)

```javascript
// test/async-timeout.specs.js

const { suite, spec, xspec } = require('../');
const assert = require('assert');

suite('AsyncTimeout', () => {
    spec('should add one', async () => {
        let count = 1;

        await setTimeout(() => {
            count = count + 1;
        }, 1000)

        assert.equal(count, 2);
    })

    xspec('should be ignored', () => {
        //whatever
    })

    spec('should throw', async () => {
        const fn = async () => {
            await setTimeout(() => {
                throw new Error('asd');
            }, 1000);
        }

        await assert.rejects(fn, Error);
    })
})
```

Of course you can also `clearTimeout` and `clearInterval` as you're used to do:

```javascript
const timeout = setTimeout(() => {
  // whatever
}, 10000);

clearTimeout(timeout);

const interval = setInterval(() => {
  // whatever
}, 10000);

clearInterval(interval);
```

Launching is hence

```bash
$ titef test/async-timeout.specs.js
```

> ## Remark
> `setTimeout` and `setInterval` are replaced by Promise-based versions 
> only when you run your script using our CLI (as above).

# Test (without CLI)

Unfortunately (read [here](#remark)) tests involving `setInterval` and `setTimeout` cannot be run outside our CLI tool