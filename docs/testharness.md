---
layout: docs
type: [writingtests]
title: Writing Javascript Tests

---

Javascript tests are the correct test type to write in any situation
where you are not specifically interested in the rendering of a page,
and where human interaction isn't required. These tests are written
using a framework called `testharness.js`. Various pieces of
documentation are avaliable:

<!--  * [Tutorial](testharness-tutorial.html) - An introduction to
     `testharness.js` for new users -->

  * [Library Documentation](testharness-library.html) - A full
     discussion of the library and detailed API reference.

  * [idlharness.js Documentation](testharness-idlharness.html) - A library for
     testing IDL interfaces using `testharness.js`

  * [wptserve Documentation](http://wptserve.readthedocs.org) - A reference to
     `wptserve`, the web server used by web-platform-tests, useful
     when writing tests that require special server-side behaviour.
