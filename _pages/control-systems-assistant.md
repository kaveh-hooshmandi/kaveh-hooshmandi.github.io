---
title: "Applied Control Systems - Course Assistant"
permalink: /courses/control-systems/assistant/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Local Course Assistant

This lightweight assistant runs inside the web page and gives basic guidance using the course knowledge base. It does not require an API key and does not send student questions to an external server.

<div class="assistant-box">
  <label for="courseQuestion"><strong>Ask a course question:</strong></label>
  <textarea id="courseQuestion" rows="4" placeholder="Example: What is overshoot? How do I tune a PID controller? What should I include in a lab report?"></textarea>
  <button onclick="answerCourseQuestion()">Ask</button>
  <div id="courseAnswer" class="assistant-answer">Type a question and press Ask.</div>
</div>

## Suggested questions

- What is the difference between open-loop and closed-loop control?
- What is overshoot?
- How does integral control affect steady-state error?
- Why is sampling time important?
- How should I write a lab report?
- What final project can I choose?

<script src="/assets/js/control-course-agent.js"></script>
