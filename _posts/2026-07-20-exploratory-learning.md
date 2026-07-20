---
layout: post
title: "Exploratory Learning: Discovering hica via the REPL"
date: 2026-07-21
tags: [hica, REPL, learning]
comments: true
---

The best way to learn a new programming language is to play with it. Reading documentation or scanning source files is fine, but you don't really get a feel for the syntax and semantics until you start typing code and seeing what happens.

This is where the REPL shines.

Instead of just running the files in the `examples/` directory as static binaries, you can load them directly into hica's REPL. This lets you inspect their types, call functions with different arguments, and even write new helpers on top of them interactively.

This post walks through how to explore hica examples in the REPL and how Hindley-Milner type inference makes interactive learning a lot faster.

### Querying types on the fly

Because hica uses Hindley-Milner type inference, the compiler always knows the types even if you didn't write them down. When you load an example into the REPL, you don't need to guess what arguments a function takes or go digging through the source code. You can just ask the compiler.

With the `:t` command, you can query any function or expression:

```hica
hica=> :t fizzbuzz
  (n: int) : string
```

This tells you the exact signature of `fizzbuzz`. You get instant feedback without having to run the code or look at the files.

### A typical session

To start exploring, run the REPL from the root of the project:

```sh
hica repl
```

You can load any example using `:load`. The REPL will parse and type-check the file:

```hica
hica=> :load examples/fizzbuzz.hc
  loading examples/fizzbuzz.hc
  loaded: fizzbuzz
```

If you want to see what functions were loaded, use `:defs`:

```hica
hica=> :defs
  fun fizzbuzz(n)
```

Now check the type of `fizzbuzz`:

```hica
hica=> :t fizzbuzz
  (n: int) : string
```

Once loaded, you can evaluate expressions directly:

```hica
hica=> fizzbuzz(15)
"FizzBuzz"
hica=> fizzbuzz(7)
"7"
```

You can also define new functions on top of what is already loaded. For example, we can write a helper to run `fizzbuzz` over a range of numbers:

```hica
hica=> fun fizz_range(lo, hi) { [lo..=hi] |> map(fizzbuzz) }
  defined: fizz_range
```

And run it:

```hica
hica=> fizz_range(1, 15)
["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
```

If you want to switch to a different example, there is no need to restart the REPL. Just reset the state and load another file:

```hica
hica=> :reset
  state cleared
hica=> :load examples/word_count.hc
  loading examples/word_count.hc
  loaded: count_words, show_entry
```

### Useful commands

Here is a quick reference of the available commands:

```sh
:load <file>     # Load a hica source file
:defs            # List all active functions, structs, and enums
:t <expr>        # Show the inferred type of an expression
:reset           # Clear the active environment
:help            # Show all commands
:quit            # Exit the REPL
```

### Suggested progression

If you want to explore the examples, this is a good order to go through:

1. `examples/fizzbuzz.hc`: Basic control flow, conditionals, and integers.
2. `examples/word_count.hc`: List pattern matching, recursion, and string manipulation.
3. `examples/json_parser.hc`: Custom enums (ADTs), tuple usage, and parser states.

Have fun exploring!

> *Feedback loops are the ultimate learning accelerant.*
