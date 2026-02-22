---
layout: post
title: The Pull Request Trap
tagline: Why Your Trunk-Based Development is Stalling
tags: [DevOps, culture, TBD, The Claes Test]
comments: true
---

Most developers recognise the "waiting room" of software development. The code is written, the tests are green, and the change is ready. Then you hit `git push`, open a Pull Request (PR), and the work stops moving, the wait begins.

In many teams, PRs have become the standard way of working. They are introduced to improve quality, but they also introduce waiting and hand-offs that slow integration. Over time, the workflow itself becomes the constraint. If you are trying to pass [The Claes Test](https://cladam.github.io/projects/the-claes-test/), especially Question 11 (CI/CD) and Question 7 (Collaboration), the pull request process may be what is holding you back.

### The Hidden Cost of the "Gatekeeper"

The PR model introduces several costs that are easy to overlook but directly conflict with a high-throughput culture.

**Wait time**

This is pure queue time. In a PR workflow, the gap between “code complete” and “code integrated” stretches into hours or days. In a healthy TBD system, it is measured in seconds, or at least minutes.

**Context switching**

Developers don't sit idle. They start something new while waiting. When the feedback finally arrives, they must drop their current work to revisit old code. 
Their flow is broken repeatadly, it's a real "flow killer."

**Batching**

Because the "transaction cost" of opening a PR is high, developers tend to batch more changes into a single PR. Larger batches are harder to review, harder to test, and riskier to deploy.

**A false sense of safety**

Many reviews end with a quick “LGTM” under time pressure. The gate exists, but are ceremonial in nature and the signal is weak.
With non-blocking reviews, the code is already live, which raises the bar for real understanding rather than rubber-stamping.

### The CI efficiency paradox: “Do we really test every commit?”

A common objection to true TBD is the perceived cost of running full CI on every small change.
In practice, small increments are far more efficient than large batches.

**Human time versus compute time**

A developer’s hour costs far more than a CI runner’s hour. Pausing flow to save compute is almost always the wrong trade-off.

**Continuous verification**

When CI runs in parallel with development, feedback arrives within minutes. Small changes are confirmed before the next task even begins.

**Reduced blast radius**

When a ten-line commit fails, the fix is immediate and obvious. When a thousand-line PR fails, investigation becomes slow and uncertain.

**Incremental testing**

Modern pipelines can scope tests to the parts of the system that changed. Small commits allow feedback to stay fast and focused.

### Why gates do not automatically create quality

The industry often assumes that more approval steps lead to safer software but DORA research consistently shows the opposite.

High-performing teams favour lightweight, fast feedback and rapid integration. Heavy approval processes correlate with longer lead times and lower deployment frequency, without improvements in stability.

| Metric                  | PR-centric flow      | Non-blocking flow                  |
| :---------------------- | :------------------- | :--------------------------------- |
| Lead time               | High                 | Low                                |
| Context switching       | Frequent             | Minimal                            |
| Batch size              | Large                | Small                              |
| Primary quality signal  | Asynchronous review  | Automated checks + fast correction |
| DORA performance        | Lower                | Higher                             |

Quality comes from fast feedback and rapid correction, not from waiting.

### A practical alternative: pairing and non-blocking reviews

In `tbdflow`, the workflow shifts away from PRs as gates and toward continuous integration by default.

**Pair or mob programming**

Real-time review happens as the code is written. The four-eyes principle is built into the work itself.

**Non-blocking reviews**

Changes integrate immediately. CI starts at once. Review happens in parallel.
If an issue is found, the team fixes forward.

**Atomic commits**

When integration is effortless, changes stay small. Small commits are easier to understand, easier to test, and easier to correct.

### Summary: Throughput is a Safety Feature

Pull Requests are often treated as a safety mechanism. The assumption is that stopping changes before integration reduces risk.

In practice, safety comes from fast feedback and the ability to correct problems quickly. Systems that integrate continuously tend to detect issues earlier and recover faster.

Removing the PR trap does not remove quality control. It shifts quality into the daily work: small changes, fast feedback, and shared responsibility for the trunk.

That shift is less about tooling and more about how teams work together.
