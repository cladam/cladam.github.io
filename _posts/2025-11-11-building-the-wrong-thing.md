---
layout: post
title: Are You Building the Wrong Thing?
tags: [waste, software development, team, product]
comments: true
---

In the first post, I introduced [nine wastes that hide in software teams](https://cladam.github.io/2025/10/24/nine-wastes-intro/). In the second, we looked at the [flow killers that destroy momentum](https://cladam.github.io/2025/11/03/flow-killers/).

But flow is useless if you're building the wrong thing.

It doesn't matter how fast or efficient your team is if they are heading in the wrong direction. This brings us to the next, and often the most costly, set of wastes: those that relate to the product itself.

### 1. Building the Wrong Thing

This is the cost of building a feature or product that fails to address real customer or business needs

This is one of the most serious types of waste. As management theorist Russell L. Ackoff said, 
> "It is much better to do the right thing wronger than the wrong thing righter. If you do the right thing wrong and correct it, you get better".

An efficient team building the wrong product is simply getting better at creating something nobody wants.

**In practice, teams go wrong here in a few predictable ways:**

* **Ignoring customer needs:** This includes not doing customer research, failing to validate ideas, or ignoring user feedback .
* **Ignoring business needs:** This includes unclear product priorities or not involving business stakeholders, leading to slow or non-existent feedback.
* **Building on false assumptions:** This happens when prototypes or MVPs are built based on unverified technical assumptions or organisational dependencies.

**How to reduce this waste:**

* **Validate aggressively:** Use techniques like feature validation , usability testing , and participatory design.
* **Use falsifiable hypotheses:** Frame new ideas as a hypothesis that can be proven or disproven (_"We believe X will cause Y, and we'll know it's true when Z happens"_).
* **Release frequently:** Shorten feedback loops so you can correct course early before you've wasted significant effort.

### 2. Unnecessary Complexity

This is the cost of making something more complicated than it needs to be; it's a missed opportunity to simplify features, user interfaces, or code.

Unnecessary complexity is intrinsically wasteful. The more complicated a system is, the more difficult it is to learn, use, maintain, extend, and debug.

This waste often appears as overly complex user interactions or technical designs when a simpler approach would have worked.

**How to reduce this waste:**

* **Embrace YAGNI and KISS:** Remember _"You Ain't Gonna Need It"_ (YAGNI) and the KISS principle (_"Keep It Simple, Stupid"_). Do not build for a hypothetical future.
* **Question new features:** Always consider whether a proposed feature is worth the additional complexity it will introduce.
* **Follow Gall's Law:** This law states that _"all complex systems that work evolved from simpler systems that worked"_. If you want to build a complex system, build a simple system first and then improve it over time.

Every time you choose a complex solution, you are taking out a "**complexity loan**" that your team will have to pay interest on forever.

### What's Next?

We've covered wastes of flow (how you build) and wastes of product (what you build).

In the next post, we'll look at the technical wastes that hide in the code itself, the friction that accumulates over time and makes all future work harder. We'll be covering **Rework**, **Extraneous Cognitive Load**, and **Knowledge Loss**.

More on that in the next post.