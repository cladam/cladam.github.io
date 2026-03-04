---
layout: post
title: The Panic Button for Trunk-Based Development
tags: [DevOps, tbdflow, tbd]
comments: true
---

Trunk-Based Development is designed for speed. It removes waiting and keeps integration continuous. Code moves to the trunk quickly, often within minutes.

But fast integration has a requirement: the trunk must stay green.

Anyone who has pushed a commit to `main`, seen CI fail, and realised the rest of the team is now blocked knows the situation. 

In TBD, the rule is simple: **Fix it or revert it.**

Speed only works when recovery is just as fast as integration.

### The friction of manual reverts

In theory, `git revert` is simple. In practise, doing it while the team is waiting introduces unnecessary friction.

When the trunk is broken, you typically need to:

* Make sure you are on `main`
* Pull the latest changes so you are not reverting on a stale head
* Find the correct SHA
* Run the revert
* Resolve any metadata or message issues
* Push the change

None of this is complicated. But under time pressure, small mistakes happen. A wrong SHA, a stale branch, a revert on the wrong base.

The time saved by skipping a Pull Request can quickly turn into time spent stabilising the trunk.

### Introducing `tbdflow undo`

With version 0.22, I added a simple command:

```bash
tbdflow undo <sha>
```

It is intentionally opinionated, the command is built for reliability.

When you run it, `tbdflow`:

* Syncs with the remote trunk to ensure your local state is current
* Verifies that the provided SHA exists on the trunk
* Performs a clean revert with a conventional commit message
* Pushes the revert immediately

The goal is simple: remove the friction when you need the trunk green again, fast.

### Fast recovery enables fast integration

Teams are often cautious about Trunk-Based Development because the `main` branch feels exposed.

In practise, safety in TBD does not come from gates. It comes from fast feedback and fast correction.

If reverting is easy and predictable, the cost of a mistake drops significantly. That lowers hesitation. Smaller commits feel safer. Integration stays frequent.

`tbdflow undo` is a small feature, but it reinforces an important principle:
**Continuous integration only works when continuous recovery is equally simple.**

Version 0.22 is available now.
You can read more in the [GitHub documentation](https://github.com/cladam/tbdflow#undo) or explore how this fits with non-blocking reviews and post-integration audits.

> Throughput is a safety feature!
