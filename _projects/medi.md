---
layout: project
title: "medi"
tagline: "A speedy CLI driven Markdown manager"
---

### Overview

A fast, editor-centric, command-line notes manager built in Rust.

`medi` is a powerful tool for creating and managing your notes, articles, and documentation directly from the terminal. It's built for developers, writers, and anyone who loves the speed and focus of a command-line workflow, combining the simplicity of Markdown with the speed of an embedded database.

-----

## Key Features

  - **Speed**: Instant access to any note, no matter how large your collection grows.
  - **Interactive Fuzzy Finder**: Instantly find and edit any note by its key or title with an interactive `medi find` command.
  - **Full-Text Search**: Instantly find notes by their content, title, or tags using a powerful built-in search engine.
  - **Templates for Productivity**: Speed up repetitive writing tasks by creating new notes from custom templates.
  - **Integrated Task Management**: Turn your notes into actionable to-do lists. Add tasks to any note (`medi task add ...`), list all your pending items, mark them as complete (`medi task done ...`), and set priorities to focus on what's important.
  - **Status Dashboard**: Get a quick overview of your entire database with the `medi status` command.
  - **Flexible Input**: Create notes interactively in your editor, with a one-liner `-m` flag, or by piping from other commands.
  - **Robust Import/Export**: Easily create version-controllable snapshots of your database or import notes from disk.
  - **Shell Completion**: Generates completion scripts for `bash`, `zsh`, and `fish` for a faster workflow.

-----

## Core Philosophy

`medi` is built on a few guiding principles:

  * **CLI-first**: Everything is done through the terminal. No GUIs, no distractions.
  * **Editor-centric**: Your text editor (`$EDITOR`) is where you write. `medi` gets you there quickly and saves your work securely.
  * **Local & private**: All content is stored on your local machine. No cloud services, no network access.
  * **Zero-config start**: Install it and start writing immediately.

-----

## Technical Details

`medi` is written in **Rust**. It uses `clap` for command-line argument parsing, `sled` for the embedded key-value database and `tantivy` for searching. For the fuzzy finding i am using the `skim` crate.

[**View on GitHub →**](https://github.com/cladam/medi)

