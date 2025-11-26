---
layout: post
title: Scratchpad to Database
tags: [medi, scratch, note]
comments: true
---

I love the terminal, but I still spend half my day in Sublime Text. When an idea appears — or a meeting suddenly starts — I just hit **Cmd+N** to open a blank, unsaved buffer and start typing.

Saving it on the other hand, that is a friction point for me:
**File → Save As → choose a folder → name the file → confirm → then remember where it actually went.**

I wanted to skip the filesystem entirely. So I wrote a small Python plugin for Sublime that talks directly to **medi**.

### The frictionless workflow

**Write:** I jot down thoughts in a fresh, untitled tab.
**Push:** I press **Cmd+Shift+m**.
**Name:** A tiny input bar appears — *Medi key?* I type `meeting-notes` (or whatever so i can get back to it easily).
**Done:** The text is pushed straight into my sled database via `medi import`.

That’s it.

The plugin is also *sticky*: it remembers which medi key an individual tab belongs to. If I keep writing and hit the shortcut again, it simply updates the database.

In practice, Sublime Text becomes a GUI frontend for my CLI database, giving me the speed of a text editor with the structure of medi underneath.

#### A small caveat

This workflow is only meant for **scratch files I decide to keep**. Quick notes, meeting minutes, loose thoughts, etc.
For proper writing, especially Markdown documents, I still use my usual flow. This isn’t a replacement for that; it's a way to reduce friction when capturing throwaway notes that turn out not to be so throwaway.

#### Technical note

Under the hood, the plugin writes the buffer to a temporary file and runs:

```bash
medi import --file tmp.md --key <key> --overwrite
```

This means every edit runs through medi’s normal logic for tagging, indexing, and consistency.

The plugin is available here as a gist:
[https://gist.github.com/cladam/204ca7d09608f130ecc76b6c7095cea0](https://gist.github.com/cladam/204ca7d09608f130ecc76b6c7095cea0)
