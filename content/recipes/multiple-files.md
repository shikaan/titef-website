---
title: Multiple Files
categories: ["recipes"]
weight: 4
---

Usually you want to differentiate your test files from the rest of
your code. This might happen for example to exclude tests from the 
final bundle or the code coverage report.

Common ways of marking test files are: putting them in a `test` 
<!-- folder or using special extensions such as `.spec.js` or `.test.js`. -->

Titef CLI has your back in both the cases.

# Using  `test` folder

The following command will assume that all the files in the `test` folders
are test files

```bash
$ titef ./test
```

# Using extensions

The following command will pick only the `spec.js` files

```bash
$ titef --extensions spec.js ./src 

# or

$ titef -e spec.js ./src 
```

This command instead will use both the `spec.js` and the `test.js` files

```bash
$ titef --extensions spec.js,test.js ./src 

# or

$ titef -e spec.js,test.js ./src 
```