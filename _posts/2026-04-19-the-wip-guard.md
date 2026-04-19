---
layout: post
title: "A Time Machine for Your Working Directory"
tags: [DevOps, tbdflow, tbd, safety]
comments: true
---

In a [previous post](https://cladam.github.io/2026/04/12/capturing-intent/), I introduced the Intent Log, a way to
capture the *why* alongside the *what* during development. The Intent Log targets and solves a piece of the comprehension problem.
But there's a related problem it didn't address: **the safety problem.**

In Trunk-Based Development, you sync with the remote constantly. That's the whole point.
tbdflow is running `git fetch` and `git rebase --autostash` under the hood and originally I had trust that uncommitted files would stay untouched but there are occasions when this assumption breaks.
If a genie (or even you) runs a `git pull` then the work would be gone unless you do the git stash-pull-stash pop loop.

I've been building a feature I'm calling **WIP Guard**, a (semi-)continuous, invisible safety snapshots that give you a time
machine for your working directory.

## The three ways work gets lost

There are three scenarios that keep developers anxious in a high-frequency integration workflow:

1. **The buried stash.** A rebase fails. Git auto-stashed your changes, but the stash is now tangled in a half-applied
   rebase. Less experienced developers might panic and even experienced ones will lose minutes untangling it.

2. **The accidental overwrite.** A developer runs `git stash pop` or `git pull` manually after a failed `tbdflow sync`.
   The previous working state is gone.

3. **The context gap.** You wrote a breadcrumb with `tbdflow + "trying trait-based approach"` twenty minutes ago. But
   the *code* that inspired that thought? It only exists in your working directory, which has since moved on. The note
   is orphaned from the state it describes.

WIP Guard solves all three.

## How it works: `git stash create`

The key insight is that Git already has a mechanism for creating immutable snapshots of your working directory:
`git stash create`. Unlike a regular `git stash`, this command:

- Creates a commit object representing your index and working tree
- Does **not** add it to the stash reflog (so it can't interfere with your manual stashes)
- Produces an immutable hash that stays in the Git object store until garbage collection (typically 14–30 days)

WIP Guard calls `git stash create` silently at strategic moments and stores the resulting hash in the Intent Log.
It doesn't introduce any new concepts, just using standard Git and much more manageable.

## The four hooks

WIP Guard is "continuous" because it hooks into commands you're already running. I didn't want to add a new command, rather integrate it as helpful magic.

### Hook A: The Intent Hook

Every time you record a breadcrumb with `tbdflow +`, the CLI now captures a snapshot alongside the note:

```
$ tbdflow + "factory pattern is too complex, switching to traits"
Note recorded: "factory pattern is too complex, switching to traits"
WIP snapshot: a7b8c9d0e1
```

That hash is stored inside the note object in `.tbdflow-intent.json`. The breadcrumb is
a thought *linked to the exact code that inspired it*. You can go back to the code as it was at the moment of
realisation.

### Hook B: The Sync Hook

Before `tbdflow sync` initiates a rebase, it now does two things:

1. **Anti-collision check.** It verifies that `.git/REBASE_HEAD`, `.git/MERGE_HEAD`, and `.git/CHERRY_PICK_HEAD` don't
   exist. If a git operation is already in progress, tbdflow halts and tells you to resolve it first. This alone
   prevents a whole class of "Git ghost" states.

2. **Pre-sync snapshot.** Regardless of whether you've added notes, tbdflow captures a safety snapshot and stores it as
   `last_sync_snapshot` in the intent log. If the rebase goes sideways, your pre-rebase state is one command away.

### Hook C: The Radar Hook

`tbdflow radar` already scans for overlapping work on remote branches. Now it also silently captures a snapshot if your
working directory is dirty and the last snapshot is more than 30 minutes old. This catches the case where a developer is
heads-down coding and hours pass between syncs.

### Hook D: The Undo Hook

This one is easy to overlook. `tbdflow undo` is the "panic button". It checks out main, fast-forwards, and reverts a
commit. That's a destructive sequence for your working directory. If you had uncommitted changes on a feature branch
when you hit the panic button, they'd be gone.

Now, `tbdflow undo` captures a snapshot and runs the same anti-collision check before doing anything. The panic button
has its own safety catch.

## The escape hatch: `tbdflow recover`

All of this snapshotting would be pointless without a clean recovery path. That's `tbdflow recover`:

```
$ tbdflow recover --list
Available WIP snapshots:
  #     Type       Timestamp              Note                                     Hash
  ------------------------------------------------------------------------------------------
  1     intent     2026-04-18T14:15:00     trying trait-based approach              a7b8c9d0e1
  2     intent     2026-04-18T14:42:00     added error variants                     f2e3d4c5b6
  3     pre-sync   2026-04-18T15:01:00     Pre-sync safety snapshot                 e1f2g3h4i5
```

To restore:

```
$ tbdflow recover 1
Warning: This will apply the snapshot over your current working directory.
Snapshot applied successfully.
The snapshot remains available for future recovery.
```

Note that we use `git stash apply`, not `git stash pop`. The snapshot commit stays in the Git store. You can apply it
again if needed. The snapshot is immutable which means you can't accidentally destroy your safety net.

## The lifecycle: what happens when you commit?

So what happens when you commit? If snapshots live in the Intent Log, and the Intent Log gets consumed by `tbdflow commit`, don't the
snapshots disappear?

Yes they do, and that's by design. The commit is the lifecycle boundary. Once your work is committed and pushed to trunk, it's
in git history. The snapshots have served their purpose. When tbdflow clears the intent log after a successful push, it
tells you:

```
Releasing 3 WIP snapshot(s) — your work is now in git history.
Intent log consumed and cleared.
```

The Git objects themselves aren't deleted, they linger in the object store until garbage collection. But the references
are gone, and that's fine. Your work is safe in a commit now.

There's an important subtlety here: **this only happens on trunk commits.** If you're committing to a feature branch,
the intent log (and all its snapshots) are preserved. The safety net stays up until your work reaches main.

## The stale-branch guard

One important safety detail: if you switch branches and try to recover a snapshot from a different branch context,
tbdflow warns you:

```
Stale intent log detected: notes were captured on 'feat/auth', but you are now on 'main'.
```

This prevents the subtle mistake of applying a snapshot from one feature's context onto another feature's working
directory.

## Why this matters for TBD adoption

The number one objection I hear when advocating for Trunk-Based Development is: **"What if I lose my work?"**

It's a fair concern. In a branch-heavy workflow, your feature branch is your safety net. You can push half-finished work
to a remote branch and it's backed up. In TBD, your work-in-progress lives locally until it's ready for trunk. That's a
trust gap.

WIP Guard closes that gap. Every breadcrumb you drop, every sync you run, every radar scan — they all leave behind an
immutable snapshot of your working directory. Your work is preserved automatically, without you doing anything different
from what you'd normally do.

The recovery path is one command, not a Stack Overflow deep-dive into `git reflog` and `git fsck`.

## Try it

WIP Guard is available now. If you're already using the Intent Log, you get snapshots for free — just keep using
`tbdflow +` as you work. If something goes wrong, `tbdflow recover --list` shows you what's available.

Give it a try: [tbdflow on GitHub](https://github.com/cladam/tbdflow).

> *Throughput is a safety feature!*
