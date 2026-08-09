---
layout: post
title: "hica analyse: Measuring Functional Debt"
date: 2026-08-05
tags: [hica, static-analysis, functional-programming]
comments: true
---

I ran `hica analyse` across my codebase last week. The report flagged twelve functions, including four I would have sworn were clean.

Then came the overall score:

```
Total FP Quality Index: 77/100
```

A score of 77 is good, but it is not 100. Seeing that number made me think: where did the missing 23 points go?

Standard linters operate on source text or surface syntax. A quick `grep` can spot a stray `for` loop, but it cannot tell you that a function returns `maybe<maybe<T>>`. That double wrapper forces callers to unwrap twice, turning `None` and `Some(None)` into two distinct states that callers are forced to distinguish.

Because `hica` runs right after the type checker, it operates on a fully-typed AST. It catches architectural design traps rather than cosmetic formatting:

```hica
fun find_first(pred: (int) -> bool, xs: list<int>) : maybe<maybe<int>> {
  Some(filter(xs, pred) |> head)
}
```

Here, `head` already returns `maybe<int>`. Wrapping it in `Some(...)` is redundant and turns the function signature into a trap. The fix is a single line:

```hica
fun find_first(pred: (int) -> bool, xs: list<int>) : maybe<int> =>
  filter(xs, pred) |> head
```

The typed AST also unlocks deeper analysis through Koka's effect system. The analyser knows when a function looks pure on the surface but is not. A `calculate_total` function hiding a `print` statement inside an order-summing loop is detectable not from the source text, but directly from the effect row in the type tree. The guidance remains consistent: push I/O to the boundaries and keep core logic pure.

When tackling a larger codebase, filtering for the worst offenders yields the best return:

```sh
hica analyse my_program.hc --format markdown --top 3
```

This dumps a structured payload for the three lowest-scoring functions: signature, location, debt score, flagged anti-patterns, and the original snippet.

This format works well as a prompt payload for an LLM. Providing a report that specifies line numbers, scores, and flagged anti-patterns gives the model explicit constraints. You get targeted rewrites instead of vague suggestions.

In practice, the score alone is usually enough. Seeing `[CRITICAL] my_program.hc:12 (score: 18)` next to code written yesterday provides immediate clarity. Once a tool pinpoints the exact line and underlying flaw, fixing it directly is often faster than delegating it.

A score simply highlights where friction exists in your codebase. Whether you fix accidental debt or accept intentional trade-offs is still up to you.

## Quick reference

```sh
hica analyse <file>                           # text report (terminal colours)
hica analyse <file> --format markdown         # markdown payload
hica analyse <file> --format markdown --top 5 # top 5 issues only
hica analyse .      --document                # generate project docs
hica analyse .      --document --check-docs   # verify docs are in sync
```