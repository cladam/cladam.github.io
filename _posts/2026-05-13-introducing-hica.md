---
layout: post
title: "Introducing hica: a language that transpiles to Koka"
date: 2026-05-13
tags: [koka, languages, hica, learning]
---

In my post about cloning [ls in Koka](https://cladam.github.io/2026/05/06/koka-ls-clone/) I mentioned wanting to build a small language that transpiles to Koka. That idea has become **hica**!

### The itch

hica is a statically typed, expression-oriented language. It compiles `.hc` source files through a Pratt parser and Hindley-Milner type checker, emits Koka `.kk` source, and lets Koka handle the rest.

I've wanted to design my own language for years. Every attempt fizzled out in the same place: the plumbing. Lexers, type systems, backends, memory management – the mountain of infrastructure you need before you can even think about syntax. It felt like building a house by first inventing concrete in a way…

But then it occurred to me, if I target Koka, I skip all those parts. Koka already has Perceus for memory, C/JS/WASM backends, a standard library, optimisation passes, and the effect runtime. I just need to build the front half: syntax, type checker, diagnostics, and an emitter that spits out `.kk` files. Koka handles the rest.

The constraint is that hica can only express what Koka can express, but given that hica's design pillars (algebraic effects, Perceus memory, expression-oriented, strong inference) are exactly what Koka already provides, that costs almost nothing.

### What it looks like

```rust
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

Everything is an expression: `if`, `match`, blocks all return values. No `return` keyword. `"{n}"` is string interpolation. The name stands for **H**indley-milner **I**nference **C**ompiler with **A**lgebraic effects.

The pipeline is straightforward:

```
.hc source → Lex → Parse → Desugar → Type Check → Emit Koka (.kk) → Koka Compiler → C/JS/WASM
```

Each compiler phase uses algebraic effects for its state: diagnostics, type variables and symbol scopes are all effect-tracked. Compilers in Koka are surprisingly natural. The type checker runs Hindley-Milner unification and the emitter annotates the Koka output with the inferred types.

### The tooling

I really enjoy building CLI tools, hica comes with `hica run`, `hica build`, `hica check` (which reports effects!), `hica test`, `hica fmt`, `hica new`, `hica clean`. 
The CLI is using my Clap inspired [klap library](https://github.com/cladam/klap), which handles flags, subcommands, and help generation.

I needed to test hica properly and have reused [kunit](https://github.com/cladam/kunit) to validate and verify its functionality, hundreds of tests across lexer, parser, checker, codegen, and CLI.

### Built with a Genie

I used a Genie (what I call my GenAI model – thanks [Kent Beck](https://tidyfirst.substack.com/) for the term) as a pair-programming partner throughout. I maintain [the backlog](https://github.com/cladam/hica/blob/main/documentation/backlog.md) and iterate until it's right. 
It lets me focus on the design decisions; the Genie handles the mechanical parts. It's been superfun, and a breath of fresh air compared to grinding through boilerplate alone.

### Try it

The language is fun to use, and really usable with structs, enums, full pattern matching, modules, closures, UFCS, built-in testing.

I have tried to document along the way, and to be honest, I think I did a good job with it, take a look:

- [**Docs**](https://cladam.github.io/hica/docs/): language reference, quick start, and style guide.
- [**Learn hica**](https://cladam.github.io/hica/docs/learn): 36 progressive lessons from hello world to combinators.
- [**Source**](https://github.com/cladam/hica): Apache-2.0 licensed.

### Thank you, Koka

hica wouldn't exist without Koka. The effect system, Perceus, the C backend is all inherited. Huge thanks to everyone working on Koka for making it possible for someone like me to build a real language.
