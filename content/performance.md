---
title: Performance
hideSectionNavigator: true
---

So you cannot believe how fast and light Titef can be, right?

Well, brace yourself.

# Performance test

The following test is really straightforward: without testing
assertion (because both Mocha and Jest don't have a builtin 
assertion library) and without testing any implementation 
related thing, we created a huge array and tried to filter it
and sort it in the specifications of the test.

To give metrics on the performance we created a `Statistics`
class which is supposed to calculate the size of the sample,
giving us a couple of basic metrics such as _Average_ and 
_Standard deviation_.

The data we used to feed this class is gathered by Node's
`perf_hooks`.

## Code

This is the code of the test we ran

```
const { Statistics, array, print } = require('./fixtures');
const { performance } = require('perf_hooks');

performance.mark('Init');
describe('benchmark', () => {
  it('with filter', () => {
    const stats = new Statistics();

    for (let i = 0; i <= 1000; i += 1) {
      array.filter(j => j % 2);
      performance.mark('End');
      performance.measure('Duration', 'Init', 'End');

      stats.sample.push(performance.getEntriesByName('Duration')[0].duration);
    }
    // print results
  });

  it('with sort', () => {
    const stats = new Statistics();

    for (let i = 0; i <= 1000; i += 1) {
      array.sort();
      performance.mark('End');
      performance.measure('Duration', 'Init', 'End');

      stats.sample.push(performance.getEntriesByName('Duration')[0].duration);
    }
    // print results
  });
});
```

## Script

This is the script we used to run the same test on all the frameworks

```
#! /bin/bash

echo "Mocha"
npx mocha -t 100000 --reporter min ./test/performance/specs.js

echo "Jest"
npx jest --testPathPattern=performance --reporters jest-silent-reporter

echo "Titef"
npx titef ./test/performance/specs.js
```

## Result
![Titef Performance](../images/titef-performance.gif)