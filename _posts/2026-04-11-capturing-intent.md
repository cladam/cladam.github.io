---
layout: post
title: "Capturing Intent Before the Commit"
tags: [DevOps, tbdflow, tbd, culture]
comments: true
---

In previous posts, I've talked about the [Comprehension Crisis](https://cladam.github.io/2026/02/22/the-comprehension-crisis/): the risk that as we move faster, especially with AI agents, we lose the "why" behind our code. A `git diff` tells you what changed. It says nothing about what was tried and rejected. It's a record of the result, but it deletes the tries and struggles.

I've been exploring a new feature in `tbdflow` to bridge that gap: the **Intent Log**.

The goal is pretty simple (but ambitious). I want to capture the developer's (or agent's) reasoning while it's fresh, without adding the documentation tax that usually kills these efforts.

### Low friction breadcrumbs

For many of us, jotting things down is a vital mechanism for staying in flow. We need to leave breadcrumbs to maintain context as we navigate complex problems.

The problem I see isn't the act of writing; it's the friction of the "diary." We don't want to leave our environment to update a formal document or a separate ticket. We want to capture those internal realisations or "failed tries" directly in the stream of work.

To solve this, I've added two ways to log a breadcrumb during development:

```bash
tbdflow note <message>             # Log a note
tbdflow + <message>                # Shorthand alias
```

With `+`, the friction is close to zero. No shell escaping, no context switching, no separate file to manage. It also works directly without doing `task start <description>`.

### The discipline

I've added breadcrumb instructions to both tbdflow `SKILL.md` and `AGENTS.md`, they are good instructions so same rules should apply whether you're a human or an AI agent working in the repo:

* Drop a breadcrumb whenever you change approach or reject an alternative.
* Before a complex commit, there should be at least one or two breadcrumbs explaining major decisions.
* Do not wait until commit time — log as you go.

The point is that reasoning captured after the fact is reconstruction. Reasoning captured in the moment is evidence. The intent log only works if the habit is there.

### The lifecycle of a thought

The Intent Log follows a strict lifecycle designed to keep the repository clean while enriching the history.

**Capture:** The first time you use a note command, `tbdflow` creates a local `.tbdflow-intent.json`. This file is automatically added to `.gitignore` so it never accidentally hits the trunk.

**Tasks:** For more structured work, you can use `tbdflow task start "Refactor auth logic"`. This sets a high-level context that all subsequent notes are attached to.

**Integrate:** When you run `tbdflow commit`, the CLI reads your notes and injects them into the body of the commit message, positioned before any breaking change or TODO footers.

**Cleanup:** Once the commit is pushed to the trunk, the local JSON file is deleted. The reasoning is preserved in git history, but the workspace is reset.

### Handling branch drift

One challenge with local logging is branch switching. If you start a task on a feature branch and switch to a hotfix, your notes shouldn't follow you blindly.

`tbdflow` now tracks branch ownership in the intent log. If you try to add a note on a different branch than where you started, the CLI will warn you:

```bash
Stale intent log detected: notes were captured on 'feat/auth', but you are now on 'main'.
```

If you explicitly start a new task on the new branch, `tbdflow` will rebind the existing notes to the new context. The developer is always aware of which stream their thoughts belong to.

### Why this helps with TBD adoption

**Context for the auditor.** In a Non-blocking Review, the code is already integrated. The auditor needs to know the intent to verify whether the implementation matches the goal. Seeing that a developer tried and rejected a pattern saves the auditor from suggesting the same thing. Hopefully it turns into a knowledge-sharing moment.

**Agent transparency.** When an AI agent is working, it can use the `+` shorthand to think out loud. The human developer can see the agent's reasoning before the final commit is pushed. It turns the agent from a black box into a transparent colleague.

**Fighting cognitive atrophy.** By capturing these notes, the history of the struggle isn't lost. Anyone picking up a task or reverting a change can see the decision-making process.

### The result

The Intent Log captures metadata at the point of creation. It requires zero context-switching and provides value during the post-integration audit.

It makes for a more honest git history where the "why" is just as accessible as the "what."

If you want to see how the Intent Log formats the final commit message, `tbdflow` includes a `--dry-run` flag that prints it before execution. You can read more about why I believe dry-runs are essential for workflow tools [here](https://cladam.github.io/2025/08/23/dry-run/).

Give it a try and let me know if the workflow fits you and your team: [tbdflow on GitHub](https://github.com/cladam/tbdflow).

> *Throughput is a safety feature!*
