---
layout: post
title: Blazing fast search
---

When I started building `medi`, my command-line notes manager, the goal was a fast, local-first workflow. But how fast is _fast_? Could it stay fast at scale? With a database of thousands of notes, would search grind to a halt?

A user on Reddit asked the same question, so I decided to find out. At first, I hacked together a quick `bash` script, but I wanted something more solid in the test suite. The results were better than I expected.

### The test

I wrote a simple performance test that does three things:

1. **Generate Data**: Create 1,000 notes, each \~50KB of random text (\~50MB total).
2. **Build Index**: Run `medi reindex` to build a full-text search index from scratch.
3. **Run Search**: Time a “cold” search for a single word, including application startup.

### The results

The numbers speak for themselves:

* **Reindexing 1,000 notes (50MB of text):** `2.7 seconds`
* **Searching the entire database:** `106 milliseconds`


### Analysis

Rebuilding a search index for 50MB of text in under three seconds is a great sign, even if the index gets corrupted, it can be rebuilt in no time.

The real win is search speed. That 106ms includes everything: starting the binary, loading the index from disk, parsing the query, running the search, and printing the result. The actual search is probably in the single-digit milliseconds. From the user’s perspective it's instant.

This test also validates the architecture choice: `sled` for storage + `tantivy` for search is reliable and **fast**. It gives me confidence that `medi` will stay responsive with 10,000 notes as it is with just 10.

If you’re building a Rust app that needs local search, I can highly recommend [`tantivy`](https://github.com/quickwit-oss/tantivy). You can also check out `medi` and its implementation on [my GitHub](https://github.com/cladam/medi).


