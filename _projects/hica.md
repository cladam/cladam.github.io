---
layout: project
title: "hica"
tagline: "an expression-oriented language that transpiles to Koka"
tags: [project, hica]
project_id: "hica"
---

<p align="center">
  <img src="/assets/images/hica-logo.png" alt="hica logo" width="200"/>
</p>

## Overview

**hica** is a statically typed, expression-oriented programming language. It compiles `.hc` source files through a Pratt parser and Hindley-Milner type checker, emits Koka `.kk` source, and lets the Koka compiler handle the rest (native C binaries, JavaScript, or WASM).

The name stands for **H**indley-milner **I**nference **C**ompiler with **A**lgebraic effects.

By targeting Koka, hica inherits things I could never build myself:

* **Perceus**: deterministic reference counting with in-place updates (FBIP). No garbage collector and no pauses.
* **Algebraic effects**: side effects tracked in the type system. If a function touches the file system, the signature says so.
* **C11 backend**: the generated code is readable C. JS and WASM backends also available.

What I built is the front half: the syntax, the type checker, the diagnostics, and the emitter. Hica is essentially a syntax skin and a type-checking layer on top of Koka's full runtime.

## Example

```hica
fun fizzbuzz(n) =>
  if n % 15 == 0 { "fizzbuzz" }
  else if n % 3 == 0 { "fizz" }
  else if n % 5 == 0 { "buzz" }
  else { "{n}" }

fun main() {
  for i in 1..100 {
    println(fizzbuzz(i))
  }
}
```

Everything is an expression: `if`, `match`, and blocks all return values. No `return` keyword. `"{n}"` is string interpolation.

## The Pipeline

```
.hc source → Lex → Parse → Desugar → Type Check → Emit Koka (.kk) → Koka Compiler → C/JS/WASM
```

Each compiler phase uses algebraic effects for its internal state. Diagnostics, type variables, and symbol scopes are all effect-tracked. The type checker runs Hindley-Milner unification and the emitter annotates the Koka output with the inferred types.

## What's in the language

**Types & data:** int, float, char, string, bool, tuples, lists, maps, structs, algebraic enums, Maybe, Result.

**Pattern matching:** literals, wildcards, variables, constructors, or-patterns, range patterns, guards, tuple/struct destructuring, bit-level patterns, and exhaustiveness checking.

**Control flow:** if/else, match, for-in ranges, for-in lists, while, loop, repeat, break, continue.

**Functions:** arrow syntax (`=>`), lambdas, closures, higher-order functions, self and mutual recursion, UFCS (`a.f(b)` → `f(a, b)`).

**Modules:** `import "path"`, selective imports with `from "path" import { ... }`, `pub` visibility, cycle detection.

## CLI

hica comes with a full CLI built on [klap](https://github.com/cladam/klap):

```bash
hica run file.hc        # Compile and run
hica build file.hc      # Compile to binary
hica check file.hc      # Type check and report effects
hica test file.hc       # Run test blocks
hica fmt file.hc        # Format source file
hica new project-name   # Scaffold a new project
hica clean file.hc      # Remove build artifacts
```

## Testing

Tests are written directly in `.hc` files:

```hica
test "fizzbuzz multiples of 15" {
  assert_eq(fizzbuzz(15), "fizzbuzz")
  assert_eq(fizzbuzz(30), "fizzbuzz")
}
```

Run with `hica test`. The test runner is built on [kunit](https://github.com/cladam/kunit).

## Links

- [**Playground**](https://www.hica.dev/playground/): try hica in the browser, no installation needed.
- [**Docs**](https://www.hica.dev/docs/): language reference, quick start, and style guide.
- [**Source**](https://github.com/cladam/hica): Apache-2.0 licensed.
