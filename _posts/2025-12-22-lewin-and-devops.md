---
layout: post
title: Lewin's teachings and modern DevOps
tags: [DevOps, change, team]
comments: true
---

When we talk about DevOps transformation, the conversation usually starts with tools. Kubernetes. CI/CD pipelines. Cloud platforms, and nowadays LLMs.

But anyone who has tried to lead a real transformation knows that the tools are rarely the hard part; people are.

For this piece, let us go back to the work of Kurt Lewin, a psychologist writing in the 1940s. Long before DevOps, cloud computing, or even modern software engineering, Lewin was studying how groups change their behaviour. And his insights turn out to map very well to what we see in modern engineering organisations.

Lewin’s three-stage model of change, **Unfreeze, Change, Refreeze**, offers a surprisingly practical way of thinking about DevOps transformation, as a human journey from friction to flow.

Here is how that vintage psychology shows up in today’s DORA-driven world.

## Phase 1: Unfreeze – Creating readiness

Lewin’s first insight is simple and uncomfortable: you cannot reshape an organisation until you loosen its existing habits. Before anything new can emerge, the current state has to become unstable.

In engineering organisations, data is often the icepick.

We use **DORA metrics** such as deployment frequency and lead time for changes not just to measure performance, but to make the cost of the status quo visible. Numbers create a shared, objective language. They help teams see that the pain they feel every day is systemic.

This is where **Value Stream Management** becomes powerful. By visualising the path from idea to customer, we expose the waiting times, queues, and manual handovers that everyone senses but rarely sees end to end. Bottlenecks stop being abstract complaints and start becoming concrete problems we can talk about together.

There is a catch to this though.

**The warning label:** unfreezing hurts. Teams often experience the classic J-curve, a temporary dip in performance as familiar ways of working are disrupted before new ones take hold. It is a signal that change has genuinely begun, and should not be seen as a failure.

## Phase 2: Change – Movement and experimentation

Once the ice has melted, the water can move.

This is the phase most people associate with DevOps. Teams introduce the technical capabilities linked to high performance:

* Continuous Integration
* Infrastructure as Code
* Deployment automation

But tools alone do not create movement. One of Lewin’s most overlooked ideas is that behaviour is shaped by environment. If the system around people stays the same, asking them to behave differently rarely works for long.

Real change requires **team autonomy**. Teams need the authority to experiment, to adjust specifications, and to improve their own ways of working without waiting for a steering committee to approve every step.

It is essentailly the **Continuous Improvement Kata** in practice. Small, deliberate steps. Clear hypotheses. Fast feedback. Learning over certainty.

In my experience, this phase succeeds or fails based on whether leaders create enough safety for teams to try, stumble, and learn without fear.

## Phase 3: Refreeze – Making improvement the norm

This is where DevOps thinking subtly diverges from Lewin’s original framing.

In the 1940s, refreezing meant stabilising a new behaviour so it would stick. In software, freezing anything permanently is a bad idea.

Instead, the goal is to stabilise a **culture of continuous improvement**. Not a fixed way of working, but a shared expectation that change is normal.

In practice, I see two anchors that help this endure.

1. **An engineering baseline**
  A clear, mandatory set of core technical capabilities that defines the minimum acceptable level of quality. This is the non-negotiable floor that gives teams clarity and protects them from constant renegotiation.

2. **A generative culture**
  Moving away from rule-heavy, approval-driven models towards high-trust environments where information flows freely and problems are surfaced early.

This is how refreezing becomes more about flow instead of rigidity.

## Fighting gravity: Lewin’s force field analysis

Lewin also described change as a balance between opposing forces. Progress is not only about pushing harder, it is often about reducing the forces that push back.

### The driving forces, the gas pedal

* **Transformational leadership**
  Leaders who provide direction, challenge assumptions, and give teams room to think.
* **High-quality documentation**
  Unfortunately often overlooked, yet very powerful. Good documentation scales learning, reduces dependency on individuals, and strengthens every other technical capability.

### The restraining forces, the brakes

* **Shifting priorities**
  Nothing drains energy faster than constant changes in direction. What sometimes looks like agility from the top feels like chaos on the ground.
* **Felrädsla, fear of error**
  When engineers are afraid of breaking things, they will optimise for safety over progress. Blameless post-incident reviews turn failures into learning rather than punishment.

Reducing these restraining forces often unlocks more progress than adding yet another initiative.

## The bottom line

Transforming an organisation is not about installing better software. It is closer to reshaping a block of ice into a flowing river.

You disrupt frozen, siloed structures in order to create readiness. You provide automated channels and autonomy so movement can happen. And over time, you establish a steady current where adaptation feels natural rather than forced.

Kurt Lewin may never have seen a git commit, but he understood something fundamental about change. If we ignore the human system, no amount of tooling will save us. If we work with it, DevOps becomes far more than a set of practices. It becomes a way of moving together.