---
layout: post
title: Rework, Cognitive Load, and Knowledge Loss
tags: [waste, software development, team, code]
comments: true
---

In the first post, I introduced [nine wastes that hide in software teams](https://cladam.github.io/2025/10/24/nine-wastes-intro/). In the second, we looked at the [flow killers that destroy momentum](https://cladam.github.io/2025/11/03/flow-killers/). In the third, we covered the [product wastes that derail your work](https://cladam.github.io/2025/11/11/building-the-wrong-thing/).

This brings us to the downstream bottlenecks, the technical wastes that hide in the code itself.

This is the friction that accumulates over time, making every new feature harder and more frustrating than the last. These wastes are the real technical debt, the quiet, persistent productivity killers.

### 1. Rework


This is the cost of altering delivered work that should have been done correctly the first time.

This waste is so critical to team health that the [DORA Report](https://dora.dev/research/2025/dora-report/) officially added **Rework Rate** as a key metric.

This metric measures the ratio of deployments that are unplanned and performed to address a user-facing bug or incident in production. It reflects the quality of the development process itself, highlighting the cost of fixing work that wasn't right the first time.

It's important to distinguish wasteful rework from necessary changes. Reworking a product because of unforeseeable circumstances or refactoring code to handle new features is not waste, it's part of the job.

Wasteful rework, however, is the avoidable kind. It’s the cost of technical debt taken in a rush to meet a deadline (real or imagined). It's the time spent fixing defects from a poor testing strategy or clarifying ambiguous acceptance criteria after the work has already been "finished."

**How to reduce this waste:**

* **Follow the "Boy/Girl Scout Rule":** "Always leave the code better than you found it." This small, consistent effort prevents a massive clean-up operation down the line.
* **Refactor continuously:** Clean code has additional benefits: it is easier to understand, easier to modify, and has fewer defects.
* **Review acceptance criteria:** Reach for clarity before work begins to prevent "ambiguous requirements" rework.
* **Improve post-mortems:** Perform root-cause analysis on defects to fix the process, not just the bug.

### 2. Extraneous Cognitive Load

This is the cost of unnecessary mental effort required from the team just to get their work done.

Psychologist John Sweller defined three kinds of cognitive load. We want to _minimise_ the **intrinsic** (how hard the problem is) and **extraneous** (how hard the environment is) load, so we can _maximise_ the **germane** load, the "value-added" thinking that actually solves the problem.

Complex environments steal mental energy that should be spent on the solution.

**Examples of this waste include:**

* Complex or poorly documented manual deployment scripts.
* Inefficient tools or problematic, hard-to-use APIs and libraries.
* Poorly organised code that is difficult to understand.
* Unnecessary context switching.

**How to reduce this waste:**

* **Automate everything:** Especially the seldom-conducted manual tasks that everyone has to re-learn.
* **Decompose large things:** Break down large, complex stories, features, or architectures into smaller, simpler ones.
* **Refactor code that is hard to understand:** If a solution isn't clear, it's a source of cognitive load.
* **Use visuals:** Use models to describe solutions (like the C4 model) instead of a wall of text.

### 3. Knowledge Loss

This is the cost of re-acquiring information that the team once knew.

A team can lose knowledge when a person with unique knowledge leaves, or when that knowledge is isolated in one person or system (a "knowledge silo").

We often talk about the “**bus factor**”, the number of team members whose sudden absence would put the work at risk. A bus factor of 1 means all the knowledge sits with a single person, creating a clear _single point of failure_. And in reality, it’s rarely a bus; it’s someone being off sick, taking leave, or moving on to a new role.

**How to reduce this waste:**

* **Aim for collective intelligence:** The goal is to share information, knowledge, and responsibilities.
* **Promote shared ownership:** The team should co-own all the assets it produces.
* **Be transparent:** What the team is learning, designing, and delivering should be visible to everyone.

### What's Next?

We've now covered wastes in our processes, our products, and our code.

In the final post of this series, we'll look at the one thing that connects them all: **culture**. We'll explore the human-centred wastes, starting with 
**Psychological Distress**, and see how they often form the foundation for all other types of waste.

