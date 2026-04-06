---
layout: post
title: Porting Coreutils to Koka
tags: [koka, languages, learning]
comments: true
---

I collect programming languages. Most of them survive as a "Hello World" in a folder I never reopen, digital fossils of a Saturday afternoon curiosity... 
My actual day-to-day has been settled for a while: Kotlin when I'm building for the web, Rust when I need a CLI tool. I do think about them a lot, but their syntax, semantics, and functionality don't tickle me the same way anymore.

Koka broke that, and triggered a deep-dive.

### Why Koka

It's a research language from Microsoft Research. Functional, but not in the way that usually makes me bounce off after an afternoon.

The dot selection syntax was the first thing that felt right. Coming from Kotlin, I'm used to chaining: `names.filter(is-hidden).sort(cmp).foreach(println)`. Koka lets me write like that. No inside-out nesting. Data flows left to right, which is how I think about it anyway.

The effect system is the bigger deal though. A function's type signature doesn't just say what it returns, it says what it *does*. If a function reads from the filesystem, that's in the type. The compiler enforces it. You can't hide side effects.

I keep calling it "honest programming" in my head. The types refuse to lie about what the code actually does.

### Porting `ls`

I don't learn languages from tutorials. I need a real problem. So I started [koka-labs](https://github.com/cladam/koka-labs), where I'm porting GNU Coreutils one at a time. First up: `ls`.

`ls` looks simple. List files, print strings. But a proper implementation touches a lot:

* **Sorting** — I wrote my own insertion sort to get a feel for recursion in Koka and how the compiler optimises it.
* **File metadata** — Hidden files, permissions, timestamps. This is where you hit the boundary between pure logic and actual OS interaction.
* **Perceus** — Koka's reference counting system. This is what makes functional code run at speeds you wouldn't expect from a language without manual memory management.

Working through it piece by piece, following the GNU philosophy, has been a good way to see how Koka keeps things clean while dealing with the mess of a real operating system.

I have even done some C to implement missing features in stdlib needed for `ls -F`. This was super-easy, I created a C file in the same directory with a couple of small functions and then it was just to import and wire it up. 

```c
// Import my C code
extern import
  c file "fs-inline.c"

// C FFI
extern is-symlink(p : string) : fsys bool
  c "kk_os_is_symlink"
```

### What stands out so far

The effect system changes how you structure code. When side effects are visible in the types, you naturally separate pure logic from IO. Not because a linter told you to, but because the language makes that the easiest path.

Perceus is the other thing I keep coming back to. Functional languages have a reputation for being slow or memory-hungry. Koka's approach to reference counting gives you immutability without the usual performance cost. It's a serious answer to the problem that has kept functional programming away from systems-level work.

### No rush

There's no timeline on this, and no requirements. Just a compiler and a rabbit hole. I'll keep porting tools and writing about what I find.

The repo is public if you want to follow along.
