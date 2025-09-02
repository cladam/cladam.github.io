---
layout: post
title: Bringing tbdflow to the IDE
tagline: The tbdflow IntelliJ Plugin 
---

I love the terminal, but yes, most developers live in their IDE. It's their primary workspace, and modern IDEs like IntelliJ have great, integrated Git support. You can stage, commit, push, and manage branches without ever touching the command line.

So, if the IDE is so good at Git, why build a plugin for [[tbdflow]]?

Firstly because it was a fun exercise 🙂

Secondly, IDEs may understand Git, but they don’t understand _your workflow_. They don't know you practice Trunk-Based Development. They don't know you use Conventional Commits. And they certainly don't know about your team's unique Definition of Done.

I built the IntelliJ plugin to bridge that gap. It's not a replacement for the IDE's Git tools, but an **enhancement** that brings `tbdflow`'s opinionated, TBD-native guardrails to your editor.

### UI-based DevEx

At the heart of the plugin is the **tbdflow Commit Tool Window**. It provides a structured, non-blocking side panel for crafting the perfect commit :tm:.

The side panel has two key features:

- **Guided Commit form**: It gives you separate fields for the commit type, scope, message, body, and breaking changes. This makes it easy to create a well-formatted Conventional Commit every single time, without having to remember the exact syntax. This is essentially the `commit` command with most flags included as UI fields.
- **Native Definition of Done (DoD) checklist**: The plugin automatically reads the checklist from your project's `.dod.yml` file and displays it as a native checklist in the UI. The "Commit" button is disabled until you've confirmed that your work meets the team's agreed-upon quality standards. It moves your `DoD` from a document somewhere into an active part of your workflow. 

The `DoD` check is disabled if no `.dod.yml` file exists in the root directory, `tbdflow` is not forcing you to use it.

### Tools --> tbdflow

The plugin also integrates the other `tbdflow` commands (`branch`, `complete`, `sync`, etc.) into the IDE’s **Tools** menu. That means you can follow your team’s workflow without breaking flow by switching to the terminal.

### The friendly assistant, IDE-enabled

The goal of `tbdflow` has always been to be a "friendly assistant" that makes the right way the easy way. This plugin brings that assistant directly into the environment where developers spend most of their time.

It's available on [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/28339-tbdflow), and in the IDE just search for `tbdflow`. BTW, most of JetBrains products are supported, not just IntelliJ. I personally use it in RustRover.

You can explore the source code in the tbdflow monorepo at [tbdflow/plugins/intellij](https://github.com/cladam/tbdflow/tree/main/plugins/intellij)



