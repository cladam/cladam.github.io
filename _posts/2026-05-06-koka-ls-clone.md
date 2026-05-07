---
layout: post
title: "Rebuilding GNU ls in Koka"
tags: [koka, languages, learning, coreutils]
comments: true
---

In a [previous post](https://cladam.github.io/2026/04/06/koka-development/), I introduced [Koka](https://koka-lang.github.io/koka/doc/index.html) and why I started porting `ls` to it. But I never wrote about the actual backstory.

I stumbled onto Koka in my GitHub feed and it immediately got me hooked. This sentance alone is golden – "Koka is a strongly typed functional-style language with effect types and handlers that transpiles to C11".  

Right around then, I saw a LinkedIn post where someone had built a parallel `ls` in modern C++ and tagged [John Cricket](https://codingchallenges.fyi/), which led me to his coding challenges. 

If you really want to learn a language you should be hands-on and do exercises, John has listed several fun and challenging exercises but `ls` wasn't on the list, so that was the one I picked 🙂

### The Ambition

The goal: Rebuild GNU `ls` in Koka. 100% byte-for-byte compatible output.

That sounded like "a weekend project, maybe two" until I opened `ls.c`... The quick command I run hundred times a day is a 5,000-line beast of C, 83 CLI flags, and decades of accumulated edge cases. It's a masterpiece of over-engineering, and it's rock solid.

### Getting Into the Guts

I'm working against the 9.10 codebase, and the architecture is a four-stage gauntlet: **Setup → Parsing → Execution → Output**.

The setup alone is a 1,000-line jungle of globals and structs. `decode_switches()`, the monster that parses options, is nearly 600 lines long!

I have created a couple of notes if people want to learn more about the internals and tips on how to use GNU ls (and my version of course):

* [Decoded GNU ls](https://github.com/cladam/koka-labs/blob/main/docs/decoded-gnu-ls.md) – The architecture walkthrough.
* [Column Layout](https://github.com/cladam/koka-labs/blob/main/docs/gnu-ls-columns.md) – The math behind `-C`.
* [Exit Codes](https://github.com/cladam/koka-labs/blob/main/docs/gnu-ls-exit-codes.md) – The three states of "oops."
* [Usage Guide](https://github.com/cladam/koka-labs/blob/main/docs/gnu-ls-guide.md) – Practical tips for GNU `ls`.
* [Recursive Listing](https://github.com/cladam/koka-labs/blob/main/docs/gnu-ls-recursive.md) – How `-R` traverses the tree.

The official docs and the [man page](https://www.man7.org/linux/man-pages/man1/ls.1.html) are fine for users, but studying the source code is the only way to see how it really works.

### The Roadmap

I drafted a plan of 6 phases + the infrastructure needed like a testing framwork and proper CI using GitHub Actions.

1. **Phase 1 — Foundation**
2. **Phase 2 — Which files are listed**
3. **Phase 3 — What information is listed**
4. **Phase 4 — Sorting the output**
5. **Phase 5 — General output formatting**
6. **Phase 6 — Formatting the file names**

To keep myself in check, I have built a test framework (kunit) that diffs my output against the original GNU binary. CI fails immediatly if I'm out of line...

### Why Koka?

`ls` is actually a perfect stress test for Koka's unique features:
* **The Effect System:** `ls` is a mix of pure logic (sorting/formatting) and messy side effects (disk I/O, `stat()` calls). Koka's effects make that boundary visible in the types.
* **Data Modelling:** File types, sort modes, format styles, indicator kinds. The enums in `ls.c` map naturally to Koka's algebraic types.
* **Perceus:** This is Koka's secret weapon. It's a reference-counting system that allows functional code to perform like C.
* **The FFI:** Koka's standard library is still growing, so I've had to write C shims for things like symlink detection. The FFI (Foreign Function Interface) has been surprisingly painless and fun.

### Learning in Public

I'll be the first to admit: I'm a decent but not pro programmer and a total Koka novice. GNU `ls` is not "beginner friendly" territory. The C is dense and Koka's documentation is still thin compared to other mainstream languages.

I've spent a lot of time "rubber-ducking" with a Genie to get through the nuts and bolts, figuring out why `stat()` and `lstat()` treat symlinks differently, or how `-l` is supposed to silently override `-C`.

This project doesn't have a delivery-date. It's just me, a 40-year-old C program, and a language that really got me hooked. It's been a blast.

I'm not going to rebuild all of Coreutils, no way. `ls` is more than enough. But the process has triggered a different curiosity: I want to build a small language that transpiles to Koka. 🤓
Follow along at [koka-labs](https://github.com/cladam/koka-labs).
