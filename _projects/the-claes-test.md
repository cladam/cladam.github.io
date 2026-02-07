---
layout: project
title: "The Claes Test"
tagline: "The Developer Culture Test"
tags: [project, test, culture, DevOps]
project_id: "The Claes Test"
---

<style>
  .claes-test-table { width: 100%; border-collapse: collapse; margin-bottom: 2rem; table-layout: fixed; }
  .claes-test-table th, .claes-test-table td { border: 1px solid #ddd; padding: 12px; vertical-align: top; text-align: left; word-wrap: break-word; }
  .claes-test-table th { background-color: #f8f9fa; }
  .claes-test-table td:nth-child(1) { width: 4%; }
  .claes-test-table td:nth-child(2) { width: 16%; font-weight: 600; }
  .claes-test-table td:nth-child(3) { width: 30%; font-size: 0.9em; color: #555; }
  .claes-test-table td:nth-child(4) { width: 5%; text-align: center; }
  .claes-test-table td:nth-child(5) { width: 45%; }
  .claes-test-table textarea { 
    width: 100%; 
    box-sizing: border-box;
    min-height: 60px; 
    border: 1px solid #eee; 
    border-radius: 4px; 
    padding: 8px; 
    font-family: inherit; 
    font-size: 0.85em; 
    resize: vertical; 
  }
  #results-area { background: #fdfdfd; padding: 20px; border: 2px solid #eee; border-radius: 8px; margin-top: 30px; text-align: center; }
  .print-btn { background: #0058a3; color: white; padding: 12px 24px; border: none; border-radius: 5px; cursor: pointer; font-weight: 600; margin-top: 15px; }
  .print-btn:hover { background: #1a69ac; }
  
  @media print {
    .sidebar, .hamburger, .print-btn, .tags, .sidebar-social, .sidebar-footer { display: none !important; }
    .main-content { width: 100% !important; margin: 0 !important; padding: 0 !important; }
    textarea { border: none !important; overflow: visible !important; height: auto !important; }
    input[type="checkbox"] { transform: scale(1.5); }
    .claes-test-table { font-size: 10pt; }
  }

  @media screen and (max-width: 768px) {
    #interactive-test {
      overflow-x: auto;
    }
    .claes-test-table {
      min-width: 800px;
    }
  }
</style>

<div id="interactive-test">
  <p><em>A modern take on “The Joel Test”, focused on what shapes great software teams: clarity, autonomy, collaboration, sustainable engineering, and career growth.</em></p>

  <p>This test is designed for engineering leaders, managers, and teams who want to take an honest look at their developer culture.<br />
  For each question, answer <strong>“yes”</strong> only if you can clearly demonstrate it with evidence through actions, not intentions.</p>

  <p>Claes as in <code class="language-plaintext highlighter-rouge">/klaːs/</code></p>

  <hr />

  <section class="test-category">
    <h3>1. The Basics</h3>
    <table class="claes-test-table">
      <thead>
        <tr><th>#</th><th>Question</th><th>What to look for</th><th>Yes?</th><th>Evidence / Gaps</th></tr>
      </thead>
      <tbody>
        <tr><td>1</td><td>Psychological Safety</td><td>People can speak up, make mistakes, and raise concerns without fear; blameless post-mortems are practised.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>2</td><td>Fair Wage</td><td>Salaries are regularly reviewed, benchmarked, and discussed transparently.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>3</td><td>Flexible Hours</td><td>Developers can plan their day for focus and work-life balance, not rigid schedules.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
      </tbody>
    </table>
  </section>

  <section class="test-category">
    <h3>2. Clarity, Autonomy and Collaboration</h3>
    <table class="claes-test-table">
      <thead>
        <tr><th>#</th><th>Question</th><th>What to look for</th><th>Yes?</th><th>Evidence / Gaps</th></tr>
      </thead>
      <tbody>
        <tr><td>4</td><td>The “Why”</td><td>Purpose and customer value are explained, not just tasks.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>5</td><td>Clear Roadmap</td><td>Work is visible, prioritised, and linked to outcomes.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>6</td><td>Open Communication</td><td>Discussions are honest, respectful, and focused on improvement.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>7</td><td>Collaboration</td><td>Boundaries don’t block progress; teams solve problems together.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>8</td><td>Rewarded Initiative</td><td>Efforts to improve, simplify, or innovate are recognised and shared.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
      </tbody>
    </table>
  </section>

  <section class="test-category">
    <h3>3. Sustainable Engineering Culture</h3>
    <table class="claes-test-table">
      <thead>
        <tr><th>#</th><th>Question</th><th>What to look for</th><th>Yes?</th><th>Evidence / Gaps</th></tr>
      </thead>
      <tbody>
        <tr><td>9</td><td>Production Readiness</td><td>Reliability, observability, and rollback plans are part of the "Definition of Done."</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>10</td><td>Code Reviews & Testing</td><td>Code is reviewed for quality; automated tests run in CI.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>11</td><td>CI/CD</td><td>Changes can be deployed safely and frequently with minimal manual steps.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>12</td><td>On-call Processes</td><td>Incidents are handled calmly; ownership is shared and on-call is compensated or balanced with time off.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>13</td><td>InnerSource</td><td>Teams share code and tools openly across the organisation.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
      </tbody>
    </table>
  </section>

  <section class="test-category">
    <h3>4. Career Progression and Growth</h3>
    <table class="claes-test-table">
      <thead>
        <tr><th>#</th><th>Question</th><th>What to look for</th><th>Yes?</th><th>Evidence / Gaps</th></tr>
      </thead>
      <tbody>
        <tr><td>14</td><td>Technical Managers</td><td>Managers understand the technical context and support engineers effectively.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>15</td><td>Career Ladder</td><td>Paths for growth are transparent, fair, and based on impact.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>16</td><td>Parallel Tracks</td><td>Technical excellence (IC) and leadership (Manager) are equally valued.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>17</td><td>Feedback Culture</td><td>Feedback is ongoing, two-way, and used for growth.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
        <tr><td>18</td><td>Growth Investment</td><td>There’s dedicated time and budget for learning and mentoring.</td><td><input type="checkbox" class="score-check"></td><td><textarea placeholder="e.g. Link to document, example, or concrete practice..."></textarea></td></tr>
      </tbody>
    </table>
  </section>

  <div id="results-area">
    <h2>Your Score: <span id="current-score">0</span> / 18</h2>
    <p id="score-feedback" style="font-weight: bold; font-size: 1.2em;">Select your answers above.</p>
    <button onclick="window.print()" class="print-btn">Print to PDF / Save Results</button>
  </div>
</div>

<script>
  const checkboxes = document.querySelectorAll('.score-check');
  const scoreDisplay = document.getElementById('current-score');
  const feedbackDisplay = document.getElementById('score-feedback');

  function calculateScore() {
    let score = 0;
    checkboxes.forEach(cb => { if (cb.checked) score++; });
    scoreDisplay.innerText = score;

    if (score >= 15) {
      feedbackDisplay.innerText = "Exceptional developer culture: protect and build upon it.";
      feedbackDisplay.style.color = "#28a745";
    } else if (score >= 10) {
      feedbackDisplay.innerText = "Healthy foundation: identify one area per quarter to improve.";
      feedbackDisplay.style.color = "#856404";
    } else {
      feedbackDisplay.innerText = "Warning signs: focus on essentials such as safety, clarity, and leadership.";
      feedbackDisplay.style.color = "#721c24";
    }
  }

  checkboxes.forEach(box => box.addEventListener('change', calculateScore));
</script>

---

### How to Use

Run this as a team exercise. Discuss each question openly and agree on whether the answer is genuinely “yes”. 
If a question is left unticked, you’ve likely found friction in your environment.

Capture examples and gaps, then turn them into concrete improvement actions.

Remember Kurt Lewin's equation:

$$B = f(P, E)$$

*Behavior is a function of the Person and their Environment.* Fix the environment, and the behavior will follow.