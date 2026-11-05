# Typed observations before indexing and comparison

Actual mandatory Ithon qualification rejected directly indexing str.split() results in Kaleidoscope and comparing Path.read_bytes() results in Dumb Store because those imported-method results had no statically declared sequence/byte type. Each observation now receives its explicit list[str] or bytes binding before the unchanged source-preservation assertion. The rejected attempt is retained here. No checker rule, threshold, source comparison or browser predicate is disabled.

CI checks the complete maintained Ithon module before installing test-only Chromium dependencies, then runs the same checked source through the actual frontend. This reduces failed-check turnaround without treating a type check as browser execution. Hosted visual acceptance remains pending at commit creation.
