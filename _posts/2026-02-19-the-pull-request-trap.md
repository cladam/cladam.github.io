---
layout: post
title: The Pull Request Trap
tagline: Why Your Trunk-Based Development is Stalling
tags: [DevOps, culture, TBD, The Claes Test]
comments: true
---

We have all lived through the "Waiting Room" of software development. You have written the code, the tests are green, and the value is ready for the customer. Then, you hit the wall. You hit `git push`, open a Pull Request (PR), and then... you wait.

In many modern teams, the PR has become the default "gatekeeper." While intended to ensure quality, in practice, it is often a bottleneck that erodes the core benefits of Trunk-Based Development (TBD). If you are trying to pass [The Claes Test](https://cladam.github.io/projects/the-claes-test/)), particularly Question 11 (CI/CD) and Question 7 (Collaboration), the PR might be the very thing holding you back.

### The Hidden Cost of the "Gatekeeper"

The PR model introduces several "invisible" costs that directly conflict with a high-throughput culture.

**Wait time**

This is pure queue time. In a PR workflow, the gap between “code complete” and “code integrated” stretches into hours or days. In a healthy TBD system, it is measured in seconds.

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

In a traditional mindset, PRs provide stability and are seen as protection.

In a DevOps and systems thinking perspective, safety comes from the ability to detect problems quickly and correct them immediately.

By removing the PR trap, we empower developers to take ownership of the trunk. We move away from "gatekeeping" and toward a culture where every commit is treated as a production-ready investment.

It is a cultural shift, from gatekeeping towards a shared responsibility and continuous learning.
