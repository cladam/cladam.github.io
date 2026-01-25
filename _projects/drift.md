---
layout: project
title: "drift"
tagline: "Biometric health intelligence for self-regulation"
tags: [project, drift]
project_id: "drift"
---

<p align="center">
  <img src="/assets/images/drift-icon.png" alt="drift screenshot" width="200"/>
</p>

## Overview

**Drift** is a health intelligence tool built for stillness and self-regulation. As the biometric pillar of the [ilseon](https://cladam.github.io/projects/ilseon/) ecosystem, it translates the body’s quiet signals into a visual language that remains intuitive even during periods of high cognitive load.

Drift helps you understand your current capacity.

## Biometrics as a Compass

In the ilseon philosophy, self-awareness is the foundation of execution. **Drift** acts as a bridge between your physiological reality and your executive planning:

1. **Internal Weather:** Recognising that "task paralysis" is often a physiological state of high stress, not a lack of discipline.
2. **Capacity Mapping:** Using Heart Rate Variability (HRV) to determine if you have the "fuel" for deep work in **myeon** or if you should focus on recovery.

By making the invisible visible, **Drift** helps neurodivergent users navigate their day based on actual energy levels rather than perceived failure.

## Features for Stillness

### The Energy Orb

At the centre of Drift is a pulsing energy orb. It mirrors your biological rhythm, shifting in colour and animation speed to communicate your current state without requiring you to read numbers or interpret charts.

### System Stability & Stress Index (Kubios/Baevsky)

Using the smartphone's camera (PPG), Drift calculates a refined **Stress Index**based on the distribution of RR intervals. This offers a grounded signal of whether your nervous system is relatively calm or under strain.

Drift also tracks your **HRV Coefficient of Variation (CV)** to assess system stability. This helps distinguish between sustainable energy and over-arousal, when high activation may actually signal fragility.

### Peak & Valley Visualisation

A unique way to view your mental state. Each day displays your average mood (The Valley) against your most recent check-in (The Peak). 

This balances the intensity of the present moment with the wider context of the day as a whole.

## The ilseon Palette

**Drift** shares the exact same "Quiet Colours" DNA as the rest of the ecosystem to ensure a low-sensory experience:

| State | Colour | Meaning |
| --- | --- | --- |
| **Optimal** | Sage (StatusMedium) | Balanced regulation and recovery. |
| **Alert** | Ochre (StatusHigh) | Increased mobilisation and effort. |
| **Urgent** | Terracotta (StatusUrgent) | High stress or exhaustion; time to drift. |

## Technology Used

* **Language:** Built with **Kotlin** for a modern, robust Android experience.
* **UI:** **Jetpack Compose** for fluid, procedural animations and the "Energy Orb" logic.
* **Biometrics:** **CameraX ImageAnalysis** for real-time PPG pulse detection.
* **Algorithmic Baseline:** Implements a dual-window **HRV Balance** model (7-day trend vs. 60-day baseline) to filter out daily "noise" and identify physiological shifts.
* **Architecture:** **MVI** (Model-View-Intent) to handle complex biometric states predictably.

### The ilseon Umbrella

> **ilseon (Mobile):** High-speed capture and single-priority execution.  
> **myeon (TUI):** Desktop triage and executive mapping.  
> **drift (Biometrics):** Physiological grounding and capacity awareness.

**[GitHub Repository](https://github.com/cladam/drift)**

**[Play Store](https://play.google.com/store/apps/details?id=com.ilseon.drift)**