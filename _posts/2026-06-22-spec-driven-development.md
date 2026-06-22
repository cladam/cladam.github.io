---
layout: post
title: "Spec-Driven Development and the Return of Big Batch Thinking"
tagline: The feedback loop is the point, not the spec
tags: [DevOps, AI, comprehension, TBD]
comments: true
---

Some are calling it **"Spec-Driven Development."** Write a detailed specification for a large chunk of system functionality, hand it to an AI agent, and let it generate a working codebase. The argument is that shipping small, vertical slices (define a tiny piece, build it, get feedback, repeat) is too slow for the AI era.

I find myself sceptical, and not because of the AI part.

### A pattern that feels familiar

The workflow looks like this:

1. **Design** a large batch of features upfront.
2. **Generate** a large body of code from that design.
3. **Review, test, and debug** the output.
4. **Ship** it in a single release.

In DevOps, this is Big Batch Delivery. We have decades of evidence for why it struggles. Large batches amplify risk at every stage. A single flawed assumption early in the design doesn't just invalidate one feature; it invalidates everything built on top of it.

> Software requirements aren't facts. They are a network of unverified hypotheses.

The entire purpose of iterative delivery is to test those hypotheses as cheaply and as early as possible, long before you have built an ecosystem on top of them.

AI doesn't change this. **The bottleneck was never how fast code gets written. It is the feedback loop.**

### The review problem

When an AI agent produces a large, multi-thousand-line output from a single specification, that code still has to be integrated, understood, and maintained by a human team. In practice, it lands in a review gate.

I explored this in [The Pull Request Trap](https://cladam.github.io/2026/02/19/the-pull-request-trap/). Human comprehension doesn't scale with line count. A team reviewing a two-thousand-line AI-generated diff faces the same cognitive limits as a team reviewing a two-thousand-line human-generated one. Under time pressure, reviews go superficial. The gate exists, but the signal is weak.

Slower integration is the obvious problem. The less obvious one is structural debt introduced without anyone understanding it well enough to manage it.

### The comprehension dimension

There is also a subtler problem. When you optimise purely for generation speed, delivery and understanding come apart.

I wrote about this in [The Comprehension Crisis](https://cladam.github.io/2026/02/22/the-comprehension-crisis/). If a model generates the spec, the code, and the explanation, it is easy to ship without ever owning the reasoning behind it. The system looks faster but the team's capability quietly degrades.

> Human comprehension must scale with delivery, or ownership evaporates.

With large, spec-driven outputs, the team inherits a codebase they didn't reason through. When something breaks, and it will, debugging starts from a much weaker position.

### What Elephant Carpaccio teaches us

The practice of slicing work into the smallest provable unit has a name: [Elephant Carpaccio](https://alistaircockburn.com/Elephant-Carpaccio). The goal isn't smaller work for its own sake. It is to shorten the distance between a decision and its validation.

This doesn't change when an AI is doing the coding. Fast generation only helps if you can confirm assumptions just as fast. That speed advantage disappears the moment you batch everything back up into a slow, uncertain release.

Some things stay true regardless of who writes the code:

*   **Feed the smallest useful slice to the agent.** A tightly scoped prompt produces output that is easier to review, test, and validate in production.
*   **Prefer continuous integration over gates.** Trunk-based development with non-blocking reviews keeps changes flowing and keeps comprehension distributed across the team.
*   **Treat telemetry as the ground truth.** Real user behaviour, not the initial spec, is where value is confirmed or refuted.
*   **Throughput and comprehension are not in tension.** High throughput with deep understanding lets you isolate variables and adapt quickly. High throughput without understanding is how you accumulate hidden debt.

### The underlying question

Spec-Driven Development probably has a place: where requirements are stable, well-understood, and easy to verify in bulk. Most product work isn't like that.

Writing a complete spec and getting a complete codebase back feels productive. **Feeling productive and being productive are different things.** If a core assumption in the spec is wrong, the cost scales with how much was built before anyone found out.

Micro-sized batches and tight feedback loops aren't a constraint on what AI can do. They're how you find out if what the agent produced was worth building.

> *Throughput is a safety feature!*