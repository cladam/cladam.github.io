---
layout: post
title: "Don't trust, instruct and verify"
date: 2026-06-10
tags: [hica, ollama, LLM, AI]
comments: true
---

Generic LLMs are bad at niche programming languages. Ask one to write hica code and it invents syntax, uses functions that aren't in the prelude, or produces Koka with the wrong variable names. It's never seen hica, so it guesses from whatever looks closest.

A better-informed model beats a smarter one.

### The idea

Ollama lets you create custom models with a `Modelfile`: base LLM, parameters, and a system prompt. That prompt is permanent context the model reads before every message.

`hica-assistant` is built on `qwen3.6:35b-a3b` (a mixture-of-experts model, fast on a Mac) with a system prompt covering the compiler pipeline, syntax rules, the prelude API with types, the stdlib, and a table of pitfalls from real bugs I've encountered during development. 

```sh
ollama create hica-assistant -f Modelfile
ollama run hica-assistant
```

No API key needed, no data leaving the machine (works offline) and no rate limits.

### The verify part

Every snippet the model generates gets checked with the hica compiler:

```sh
hica check generated.hc
hica run generated.hc
hica test generated.hc
```

When it fails, I find the gap in the Modelfile, add the rule, and rebuild. The system prompt is the ground truth and very updateable. My chat history is throwaway.

Let's look at a concrete example: the model kept writing `is_empty(list)` to check whether a list is empty, that's wrong as `is_empty` takes a `string`. I added a row to the pitfalls table, ran `ollama create hica-assistant -f Modelfile`, and the next response used `match xs { [] => ... }` correctly.

The loop: prompt, generate, compile, fix Modelfile, rebuild.
### It works for real code

I asked it to write a filter-map-fold pipeline. First try, both styles:

```hica
fun main() {
  // pipe style
  let a = [1, 2, 3, 4, 5]
    |> filter((x) => x % 2 == 0)
    |> map((x) => x * 10)
    |> fold(0, (acc, x) => acc + x)
  println(a)   // 60

  // dot-call style, same result
  let b = [1, 2, 3, 4, 5]
    .filter((x) => x % 2 == 0)
    .map((x) => x * 10)
    .fold(0, (acc, x) => acc + x)
  println(b)   // 60
}
```

Both compile. Both produce 60. `a |> f` and `a.f()` are the same thing and the model knows when to reach for each.

### Bounded knowledge is a feature

The model only knows what's in the Modelfile. Ask it about `get_cwd()`, which doesn't exist in hica yet, and it says so and gives the real workaround (`get_env("PWD")`). A generic model would invent `get_cwd()` confidently and leave you debugging a compile error.

When something is missing from the Modelfile, I add it. Right now it covers the prelude, `std/io`, `std/list`, `std/datetime`, and the main pitfall patterns. The file grows with the language.

### The Modelfile is in the repo

The [Modelfile](https://github.com/cladam/hica/blob/main/Modelfile) is in the hica repo, Apache 2.0 licensed.

The approach works for any language, framework, or internal API a generic model hasn't seen. Write down what it needs to know, verify with real tooling, iterate.
