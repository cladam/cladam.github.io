---
layout: page
title: Voice Inbox
parent: "ilseon"
---

[← Back to Ilseon Overview]({{ '/projects/ilseon/' | relative_url }})

## 🎙️ Voice Capture & Task Extraction

The Voice feature in Ilseon is designed for high-velocity capture when you are on the move – driving, walking, or in the middle of a workout. It ensures that no task or thought is lost just because you can't reach your keyboard.

<div style="display: flex; justify-content: center; margin: 30px 0;">
	<img src="/assets/images/ilseon-screenshot-PS9.png" alt="Voice Capture Screen" style="width: 300px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.2);"/>
</div>

### Key Capabilities

* **Persistent Capture:** A dedicated foreground service ensures that recordings aren't interrupted by the OS, even if you navigate away from the app.
* **BYOK (Bring Your Own Key):** To keep the app lightweight and private, AI features are unlocked by providing your own Gemini API Key in the settings.
* **Intelligent Task Extraction:** Once a recording is transcribed, Ilseon uses Large Language Models (LLMs) to scan the text and automatically extract actionable tasks, separating them from general context.

### Open Storage & Data Portability

Ilseon follows a "local-first" philosophy. Your recordings are your own, stored in a transparent directory structure rather than hidden in a private database:

* **Location:** `Recordings/ilseon/` on your local device storage.
* **Format:** Industry-standard `.m4a` files.
* **Fidelity:** Audio is captured at **44.1kHz** with a **128kbps bitrate** using the **AAC_ELD** (Enhanced Low Delay) encoder. A professional-grade clarity whith a small storage footprint.
* **Ownership:** Because these files are stored in a standard directory, they can be backed up, shared, or managed using ordinary OS functions or third-party cloud sync tools.

#### Technical Implementation

The voice workflow is a two-stage pipeline designed for privacy and flexibility:
1. **Local Audio Processing:** The app handles the audio recording using a background service to maintain state across different Android lifecycle events.
2. **AI-Powered Refinement:** 
	* **Transcription:** Converts raw audio into text, saved as a persistent **Note**.
	* **Task Distillation:** If a Gemini API key is present, the app sends the transcript to the model (_gemini-2.5-flash_) with a specific system prompt to identify and format "Task" items.
