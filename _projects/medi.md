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

  * **Speed**: Instant access to any note, no matter how large your collection grows.
  * **Focused workflow**: A command-line hub for your writing. Create or edit notes from any directory.
  * **Flexible input**: Create notes interactively in your editor, with a one-liner `-m` flag, or by piping from other commands.
  * **Safe deletion**: An interactive confirmation prompt on `delete` prevents accidental data loss.
  * **Colourful & clear output**: Uses coloured output to clearly distinguish between success, info, warnings, and errors.
  * **Robust import/export**: Easily create version-controllable snapshots of your database or import notes from disk.
  * **Shell Completion**: Generates completion scripts for `bash`, `zsh`, and `fish` for a faster workflow.

-----

## Core Philosophy

`medi` is built on a few guiding principles:

  * **CLI-first**: Everything is done through the terminal. No GUIs, no distractions.
  * **Editor-centric**: Your text editor (`$EDITOR`) is where you write. `medi` gets you there quickly and saves your work securely.
  * **Local & private**: All content is stored on your local machine. No cloud services, no network access.
  * **Zero-config start**: Install it and start writing immediately.

-----

## Technical Details

`medi` is written in **Rust**. It uses `clap` for command-line argument parsing and `sled` for the embedded key-value database.

[**View on GitHub →**](https://github.com/cladam/medi)

