---
layout: post
title: "hica analyse: Measuring Functional Debt"
date: 2026-08-05
tags: [hica, static-analysis, functional-programming]
comments: true
---

Writing functional code is a skill you build over time. You might start with `for` loops and mutable counters, then gradually learn to reach for `map`, `filter`, and `fold` instead. At some point you start thinking in pipelines. The challenge is knowing where you are on that journey and which parts of your codebase haven't caught up yet.

`hica analyse` is a static analysis command that answers that question. It inspects a `.hc` file for deviations from the functional idioms described in the [functional programming guide](../docs/functional-programming.html), assigns debt points to each offending function, and reports a quality index for the file.

### How it works

`hica analyse` runs right after the type checker, so it operates on a fully-typed AST. That matters because some rules require type information — detecting double-wrapped `maybe<maybe<T>>` return types, for example, or knowing whether a `match` is operating on a `maybe` or `result`. The analysis doesn't need heuristics or pattern matching on source text; it inspects the typed tree directly.

```sh
hica analyse my_program.hc
```

The output looks like this:

```
=== Hica Code Quality & Functional Debt Report ===

[CRITICAL] my_program.hc:12 (score: 18)
  fun process(items): list<string>
  - [Immutability] Imperative 'for' loop used (score: +5)
    └─> Hint: Refactor to standard list combinators like 'map', 'filter', or 'fold'.
  - [Allocation] Eager list pipeline with >2 operations (score: +10)
    └─> Hint: Wrap input with 'stream(xs)' from 'std/stream' or use pipeline transducers.
  - [Style] Redundant lambda wrapper (Lambda Noise) (score: +3)
    └─> Hint: Convert to point-free style (e.g. filter(is_even) instead of filter((x) => is_even(x))).

[MEDIUM] my_program.hc:34 (score: 5)
  fun load(path): maybe<string>
  - [Immutability] Mutable 'var' declaration used (score: +5)
    └─> Hint: Suggest using 'map', 'filter', 'fold', or lazy streams instead.

Summary: my_program.hc | 1 Critical | 0 High | 1 Medium
Total FP Quality Index: 77/100
```

Functions with no issues are not listed. The **FP Quality Index** starts at 100 and subtracts total debt points across the file, clamped at 0.

---

## The six rules

Each rule corresponds to a functional programming concept. Here is what the analyser is looking for and why.

### Purity & Effects

A pure function has no side effects. It takes inputs and returns an output, nothing more. hica's type system (inherited from Koka) tracks effects explicitly, so the analyser can detect when a function that should be pure domain logic is mixing in I/O or console calls.

**Flagged (score: +8):**

```hica
fun calculate_total(orders: list<Order>) : float {
  println("calculating...")   // io effect mixed into domain logic
  fold(orders, 0.0, (acc, o) => acc + o.amount)
}
```

**Better:**

```hica
fun calculate_total(orders: list<Order>) : float =>
  fold(orders, 0.0, (acc, o) => acc + o.amount)

fun main() {
  println("calculating...")
  println(show(calculate_total(orders)))
}
```

Push the I/O to the boundary. Keep the core logic pure.

### Immutability

Mutable variables (`var`) and imperative loops (`for`, `while`, `loop`) are valid tools in hica, but they can usually be replaced with a combinator that makes the intent clearer. The analyser flags each use.

**Flagged (score: +5 per occurrence):**

```hica
fun sum(numbers: list<int>) : int {
  var total = 0
  for n in numbers {
    total = total + n
  }
  total
}
```

**Better:**

```hica
fun sum(numbers: list<int>) : int =>
  fold(numbers, 0, (acc, n) => acc + n)
```

The `fold` version states its intent directly: *reduce a list to a single value by accumulation*.

### Pipelines & Allocation

When you chain `map` and `filter` over a list, each step allocates a new intermediate list. For short lists this is fine, but for long pipelines it wastes memory. The analyser flags eager pipelines with more than two operations.

**Flagged (score: +10):**

```hica
fun process(nums: list<int>) : list<int> =>
  nums
    |> filter((x) => x % 2 == 0)
    |> map((x) => x * x)
    |> filter((x) => x > 10)
    |> map((x) => x + 1)
```

**Better:**

```hica
import "std/stream"

fun process(nums: list<int>) : list<int> =>
  stream(nums)
    .filter((x) => x % 2 == 0)
    .map((x) => x * x)
    .filter((x) => x > 10)
    .map((x) => x + 1)
    .collect()
```

The `stream` version fuses all four operations into a single pass and stops early if the downstream consumer doesn't need all elements.

### Error Handling

Matching on a `maybe` or `result` and then matching again inside one of the arms is a sign that you could use a combinator instead. The nested structure grows with each step and makes the logic harder to follow.

**Flagged (score: +8):**

```hica
fun parse_positive(s: string) : maybe<int> {
  match parse_int(s) {
    None => None,
    Some(n) => match (n > 0) {
      true => Some(n),
      false => None
    }
  }
}
```

**Better:**

```hica
fun parse_positive(s: string) : maybe<int> =>
  parse_int(s) |> and_then((n) => if n > 0 { Some(n) } else { None })
```

`and_then` chains steps that each return a `maybe`. The pipeline reads as a sequence of decisions: parse, then check positive. If any step returns `None`, the rest is skipped.

### Double Wrapping

A function that returns `maybe<maybe<T>>` is almost always a mistake. It means a caller has to unwrap twice to get the value, and `None` vs `Some(None)` become two distinct states that are easy to confuse.

**Flagged (score: +6):**

```hica
fun find_first(pred: (int) -> bool, xs: list<int>) : maybe<maybe<int>> {
  Some(filter(xs, pred) |> head)
}
```

**Better:**

```hica
fun find_first(pred: (int) -> bool, xs: list<int>) : maybe<int> =>
  filter(xs, pred) |> head
```

`head` already returns `maybe<int>`. Wrapping it in `Some` creates a redundant layer. `and_then` and `flat_map` are the tools for flattening these nested structures when they arise in pipelines.

### Closure & Lambda Noise

When a lambda does nothing but pass its argument to a single function — `(x) => f(x)` — the lambda adds noise without adding meaning. You can pass the function directly.

**Flagged (score: +3):**

```hica
fun main() {
  let nums = [1..5]
  println(map(nums, (x) => show(x)))
  println(filter(nums, (x) => is_even(x)))
}
```

**Better:**

```hica
fun main() {
  let nums = [1..5]
  println(map(nums, show))
  println(filter(nums, is_even))
}
```

This style — passing the function by name rather than wrapping it — is called *point-free*. Use it when the function name is already descriptive.

---

## The markdown format

The default output is a colour-coded terminal report. For automated refactoring workflows, use `--format markdown`:

```sh
hica analyse my_program.hc --format markdown
```

This produces a structured Markdown payload designed to be fed directly to an LLM. Each flagged function gets a section with its name, inferred signature, location, debt score, a numbered list of anti-patterns with hints, and the original source snippet:

````markdown
# Hica Analysis Hotspot: `my_program.hc`

## Function Context
- **Name:** `process`
- **Signature:** `fun process(items): list<string>`
- **Location:** `my_program.hc:12`
- **Debt Score:** 18 (Critical)

## Detected FP Anti-Patterns
1. **Immutability:** Imperative 'for' loop used (score: +5)
   - *Hint:* Refactor to standard list combinators like 'map', 'filter', or 'fold'.
2. **Pipelines & Allocation:** Eager list pipeline with >2 operations (score: +10)
   - *Hint:* Wrap input with 'stream(xs)' from 'std/stream'.

## Code Snippet
```hica
fun process(items) {
  ...
}
```
````

Use `--top N` to limit the report to the N highest-debt functions, which keeps the context window focused:

```sh
hica analyse my_program.hc --format markdown --top 3
```

---

## Generating documentation

`hica analyse` has a second mode: project documentation generation. Pass `--document` along with a directory and it analyses every `.hc` file in the project, extracts public function signatures, and writes a `docs/<project>/index.md` with per-function documentation:

```sh
hica analyse . --document
```

This reads `hica.hml` for the project name and entry point, then walks the source tree. A separate flag lets you verify whether the generated docs are in sync with the current source:

```sh
hica analyse . --document --check-docs
```

This exits with code 1 if anything is out of date — useful as a CI gate.

---

## Quick reference

```sh
hica analyse <file>                          # text report (terminal colours)
hica analyse <file> --format markdown        # markdown payload
hica analyse <file> --format markdown --top 5 # top 5 issues only
hica analyse .      --document               # generate project docs
hica analyse .      --document --check-docs  # verify docs are in sync
```

Severity thresholds:

| Score range | Severity |
|-------------|----------|
| ≥ 10        | Critical |
| 6 – 9       | High     |
| 1 – 5       | Medium   |

---

Every function that scores zero is a function you don't have to think about. The goal is not a perfect 100 — it's knowing where the friction is.
