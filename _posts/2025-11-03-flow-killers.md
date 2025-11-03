---
layout: post
title: Wastes That Kill Your Flow:
tags: [waste, software development, flow]
comments: true
---

In my last post, I introduced [nine wastes that hide in software teams](https://cladam.github.io/2025/10/24/nine-wastes-intro/).

Recognising them is the first step. The next step is learning how to remove them, starting with the ones that break _flow_.

In this post, we’ll look at the most common _flow killers_. These three wastes are often interconnected, and can quitly destroy momentum.


### 1. Mismanaging the Backlog

This is the cost of duplicating work, expediting low-value features, or delaying necessary bug fixes.

A poorly managed backlog is one of the most persistent sources of waste. One of the worst symptoms is **backlog inversion**, when low-priority items become high-priority (and vice-versa), but the backlog is never updated to reflect it. Team members then pick up tasks that *look* important but are not.

This leads to a phenomenon called **backlog thrashing**, when teams try to push more work through than they can handle. Everyone looks busy, stress rises, but very little of value gets finished.

**Examples of this waste include:**
* Working on too many features at the same time.
* An imbalance between feature work, bug fixing, and operational tasks.
* Not having enough "ready" stories, forcing the team to stop or grab unplanned work.

**How to reduce this waste:**
* Prioritise the backlog several times a week, not just once per iteration (sprint).
* Introduce **Work In Progress (WIP) limits** to minimise multitasking and finish features before starting new ones.
* De-emphasise the importance of "sprints" and aim for a continuous, sustainable flow of work.

A healthy backlog maintains flow; a neglected one blocks it at the source.

### 2. Waiting / Multitasking

This is the cost of idle time, which is very often hidden by multitasking.

When developers are blocked (waiting for information, for a build to finish, or for a dependency on another team), they rarely sit idle. Instead, they pick up a new task. This multitasking seems productive, but it introduces its own waste.

First, multitasking involves a **mental transition** to the new task, which can be time-consuming. Second, it creates a dilemma when the original high-priority task is unblocked. Does the developer finish the new, lower-priority task (delaying the important work) or immediately switch back (leaving more work-in-progress)?

**How to reduce this waste:**
* **Expose the waiting time.** Use WIP limits to prevent task-switching. This makes the *cost* of the wait visible to the whole team, which is the first step to fixing its root cause.
* For short waits (like a slow test suite), encourage taking a break instead of switching context.
* For longer waits, use the time to work on the *cause* of the wait itself.
* Aim to decouple your services and systems to reduce cross-team dependencies.

Every minute spent context-switching is a leak in your team’s flow.

### 3. Ineffective Communication

This is the cost of incomplete, incorrect, misleading, inefficient, or absent communication among stakeholders.

This waste is a "killer" because it actively *causes* the other types of waste.

When communication is ineffective, you get delays, which leads to **Waiting**. Misunderstanding user needs leads to **Building the Wrong Thing**. Misunderstanding a technical solution leads to **Overly Complex Solutions**. Poor decision-making leads to **Mismanaging the Backlog**.

**Examples of this waste include:**
* A PO or team member notices a bug and adds it to the backlog without explaining how to reproduce it. The team is then forced to waste time sleuthing.
* Inefficient meetings, such as long stand-ups, skipping retros, or not discussing blockers.
* One person dominating a conversation, which has a chilling effect on diversity of thought and quality of decision-making.

**How to reduce this waste:**
* Create a safe and inclusive space, which also allows for asynchronous communication.
* Encourage **conversational turn-taking**, where participants speak one at a time to build a shared understanding.
* Actively mitigate interruptions. If someone is cut off, other participants can "return to the interrupted speaker" by saying, "Can we come back to what Claes was saying about...".

Without shared understanding, flow collapses into churn.

### What's Next?

Flow is critical, but it's only half the story. It doesn't matter how fast you're going if you're heading in the wrong direction.

In the next post, we'll look at a different, perhaps even more expensive, kind of waste: **Building the Wrong Thing** and **Unnecessarily Complicated Solutions**.

More on that in the next post.