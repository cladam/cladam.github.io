---
layout: post
title: "The Double Trap"
tagline: "When AI accelerates the wrong system"
tags: [AI, DevOps, productivity, TBD, comprehension]
comments: true
---

In *[The Comprehension Crisis]({% post_url 2026-02-22-the-comprehension-crisis %})*, I argued that AI can quietly erode one of our most valuable engineering assets: deep technical understanding. In *[The Pull Request Trap]({% post_url 2026-02-19-the-pull-request-trap %})*, I looked at how traditional delivery workflows create queues that slow down learning and feedback.

These two ideas are closely related. Generative AI amplifies both problems simultaneously. 

I call this **the double trap**.

AI has dramatically reduced the cost of producing software. Individual developers can now generate code, tests, documentation, and even architectural proposals in minutes. Production has accelerated, yet our ability to validate and understand those changes has not. Learning is becoming the new bottleneck.

The result is a dangerous imbalance. We produce software faster than we can validate it, and we rely heavily on AI while understanding our systems less.

## The two traps

The double trap emerges when two reinforcing forces feed into each other.

<a href="/assets/images/the-double-trap.png" target="_blank">
  <img src="/assets/images/the-double-trap.png" alt="The Double Trap diagram" style="max-width: 75%; display: block; margin: 20px auto; border-radius: 4px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" />
</a>

### Trap 1: Faster output, slower feedback

DevOps has always been about shortening feedback loops. AI changes the economics of production while leaving the downstream constraints completely intact. Customer validation, testing, operational feedback, and organisational learning all still take the same amount of time.

Using AI to generate more code within the same delivery model only moves the bottleneck. More code creates larger queues that delay feedback. Ultimately, the system becomes much busier without actually becoming more effective.

This is the exact pattern behind the Pull Request Trap. When every developer can generate dramatically more code, asynchronous review queues become completely overwhelmed. The bottleneck shifts downstream, where changes sit waiting to be reviewed, integrated, tested, or understood. AI compresses production time, while feedback remains constrained by human speed.

AI optimises the productivity of individual developers. Organisations succeed by optimising the performance of the entire delivery system. Those are not the same thing.

### Trap 2: Less thinking, less understanding

At the same time, AI fundamentally alters how we solve problems. When developers repeatedly outsource reasoning to an assistant, they make fewer architectural decisions themselves. They find themselves evaluating more than they create, and over time, their internal mental models weaken.

True comprehension is built through decision-making. We understand systems by exploring trade-offs, debugging failures, and explaining *why* one solution is better than another. If AI performs the bulk of that cognitive work for us, we gradually lose the intuition that makes experienced engineers valuable. 

The real risk is perfectly correct-looking code that nobody in the team truly understands.

## Why these traps reinforce each other

These two problems create a vicious reinforcing loop. Faster code generation increases the sheer volume of work entering the system, leading to longer queues and delayed feedback. As feedback slows down, so does learning. 

This reduced understanding makes teams depend even more heavily on AI to explain, generate, and modify the codebase, which in turn generates even more output. The entire system accelerates while the underlying organisational capability slowly declines. Teams become busier while learning less.

## Escaping the double trap

To escape this loop, we have to improve the systems we work in.

### Build to learn before you build to earn

Use AI aggressively during product discovery. Prototype quickly, challenge assumptions, explore alternatives, and validate customer problems before investing heavily in production-quality software. Speed is most valuable when you are in the phase of learning.

### Optimise feedback, not output

Practices like small batches, continuous integration, automated verification, and rapid deployment reduce the time between making a change and learning whether it was the right one. AI makes these practices even more essential.

### Keep humans responsible for understanding

Use AI to generate options, not ownership. Every significant design decision must still be understood, challenged, and explained by the team responsible for operating the system. If you cannot explain why a solution works, you do not really own it.

### Measure learning

Counting lines of code or completed tickets was never a good measure of progress. In an AI-assisted world, it is completely meaningless. Instead, optimise for customer feedback, deployment frequency, lead time, recovery time, and validated outcomes. These are the true signals that the organisation is learning.

## Velocity isn't the goal

AI dramatically accelerates software production, yet organisations still improve in the same fundamental ways. High-performing teams have always won by learning faster than everyone else. DevOps, Lean, and Trunk-Based Development all exist to shorten the feedback loops that make learning possible.

Velocity has never been the goal, learning has. Organisations that pair AI with fast feedback, small batches, continuous integration, and deep technical ownership will increase both their delivery speed and their overall capability. Those that optimise for output alone will fall straight into the double trap: producing more, while understanding less.
