Documentation extractor
===

_Work in progress_

It is just about extract documentation strings from code and output them in gron
format. In scope of the `docex` is only this step. Documentation can be generated
like this:

```
awk -f docex.awk -v doc_prefix='##' example.sh \
  | gron --ungron \
  | jq -f format.jq > example.md
```
