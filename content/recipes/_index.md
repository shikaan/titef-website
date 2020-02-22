---
title: "Recipes"
weight: 1
---

**Titef** was built with a very clear and simple idea in mind: testing is
boring, thus we needed to make it as *easy* and as *fast* as possible.

To make this true we built this collection of recipes meant to be a 
vademecum for developers: hopefully after a couple of times you won't 
need to read any longer.

# Assumptions
_Recipes assume_ the following basic knowledge:

- Basic understanding of how `Promise` works;
- Familiarity with ES6+ syntax;

It's a plus being familiar with `async/await` flow, but you can easily 
follow recipes without this knowledge. May this be the first good chance
to learn this pattern?

_Recipes do not assume_ anything about the assertion library: as long
as you're using something which throws an `AssertionError` when an 
assertion fails, you're good to go.

The following assertion liraries are hence supported:

- [assert](https://nodejs.org/api/assert.html);

- [chai](http://chaijs.com);

- [should.js](http://shouldjs.github.io);

If you want to stick with lightness of **Titef** we suggest to use Node
builtin `assert` library, but who are we to judge you?

