---
layout: post
title: "Beyond the Branch: The Social Fabric of Trunk-Based Development"
tags: [DevOps, tbdflow, TBD, culture]
comments: true
---

When discussing Trunk-Based Development (TBD), we often get bogged down in the mechanics: the branching strategy, the CI speed, or the revert logic. But as a colleague recently pointed out to me, moving away from Pull Requests (PRs) is a **"drastic change"** that impacts more than just Git history. It impacts the social fabric of the team.

The common fear is that without the "gate" of a PR, we lose our collective understanding of the repository. We worry that Seniors will lose sight of what Juniors are doing, and that the codebase will suffer from a form of cognitive atrophy.

In reality, safety in TBD does not come from the gate. It comes from moving from **Gatekeeping** to **Continuous Inspection.**

### The Fallacy of the Gatekeeper

The Pull Request model assumes that awareness happens at the point of the merge. We believe that because three people looked at a 400-line diff, the team now "understands" the change.

In practise, this often creates a false sense of security. PRs frequently become bottlenecks where Seniors, overwhelmed by volume, perform a "rubber-stamp" review just to unblock a teammate. I explored this dynamic in more detail in [The Pull Request Trap](https://cladam.github.io/2026/02/19/the-pull-request-trap/). This is where cognitive atrophy actually starts: when the review becomes a chore rather than a conversation.

TBD takes a different approach. By removing the block, we encourage the team to find more disciplined, continuous ways to share knowledge.

### An Iteration in the Life of a TBD Team

To understand how this works, we have to look past the commands and see how the team actually interacts throughout a typical iteration of work.

#### The Morning: The Social Radar

In a PR-heavy world, you start your day by checking a backlog of notifications. In a TBD team, you start by looking at the stream.

**The Sync:** A developer runs `tbdflow sync`. Instead of a blind pull, the tool checks the CI status of the trunk. If it is red, they wait. This simple check prevents the "Monday Morning" frustration of pulling a broken build and spending an hour debugging someone else's mistake.

**The Radar:** A Senior engineer runs `tbdflow radar`. They notice a Junior is currently touching a sensitive auth module. Instead of waiting for a PR two days later, the Senior reaches out immediately: *"I see you're in the auth logic; let's pair for twenty minutes on the error handling."*

Knowledge is shared **before** the code is even committed, not as a post-hoc correction.

#### The Work: Executable Standards

TBD requires a high level of discipline. We replace the "PR Template" with an executable _Definition of Done_ (DoD).

As the team works in small, atomic batches, `tbdflow commit` presents an interactive checklist. *"Did you add tests?" "Is the documentation updated?"* This moves the "manual checks" from a document no one reads into a CLI flow no one can ignore. The machine checks the machine, ensuring that only "Done" code reaches the trunk.

#### The Afternoon: The Audit Loop

This is where the collective understanding is maintained. In TBD, we practise **Non-blocking Reviews (NBR).**

The Senior spends thirty minutes reviewing the day's "Digest." They see a commit that is already live and passing tests. They notice a slight architectural misalignment. Instead of blocking the developer's momentum, they raise a concern.

The Junior isn't stopped. They simply integrate the Senior's feedback into their next "fix-forward" commit. The learning loop is measured in hours, not days. The Junior grows faster because they are constantly receiving small, digestible pieces of feedback rather than a massive "Request Changes" dump at the end of a task.

### Continuous Inspection over Gatekeeping

The "drastic change" of TBD is moving from a world of **Checkpoints** to a world of **Streams.**

PRs ensure people have *"seen"* the code, but TBD ensures people are **aligned** with the code. By integrating in tiny batches, the "target" for review is smaller and harder for bugs to hide in. By using tools like `radar` and `review --digest`, the team maintains a constant, peripheral awareness of the whole repository.

> TBD doesn't remove the team's responsibility to understand the codebase. It just provides a faster, more honest way to achieve it.

Using `tbdflow` is entirely optional. The tool is built on standard `git` and `gh` CLI commands, and you can always perform these actions manually. If you want to look under the hood to see exactly how it works, `tbdflow` includes a `--dry-run` flag that prints every underlying command before it runs. You can read more about why I believe dry-runs are essential for workflow tools, [Looking under the hood with a dry-run](https://cladam.github.io/2025/08/23/dry-run/).
