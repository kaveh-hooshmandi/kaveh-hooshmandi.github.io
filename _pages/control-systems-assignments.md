---
title: "Applied Control Systems - Assignments"
permalink: /courses/control-systems/assignments/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Assignments and Quizzes

## Assignment 1 — Open-Loop vs Closed-Loop Control

**Task:** Choose three real systems and classify them as open-loop or closed-loop.

For each system, identify:
- Reference input
- Plant
- Sensor
- Controller
- Actuator
- Disturbance

**Example systems:** motor speed control, room temperature control, mobile robot navigation, water tank level control.

---

## Assignment 2 — Transfer Function and Step Response

A plant is given by:

`G(s) = 5 / (2s + 1)`

1. Identify the gain and time constant.
2. Sketch the expected step response.
3. Calculate the approximate time to reach 63.2% of the final value.
4. Simulate the response in Python or MATLAB.

---

## Assignment 3 — Transient Response and Stability

A second-order system has:

`omega_n = 5 rad/s` and `zeta = 0.4`

1. State whether the response is underdamped, overdamped, or critically damped.
2. Explain the expected shape of the response.
3. Estimate whether overshoot will occur.
4. Discuss how increasing damping affects the response.

---

## Assignment 4 — PID Controller Selection

A DC motor speed-control system has slow response and a steady-state error.

1. Explain why proportional control alone may not remove the error.
2. Propose a PI or PID controller.
3. Describe the expected effect of increasing `Kp`, `Ki`, and `Kd`.
4. Explain one risk of using too much integral action.

---

## Short quiz bank

1. What is the main purpose of feedback?
2. What is steady-state error?
3. What does overshoot mean?
4. Why can high proportional gain cause instability?
5. What is the role of integral control?
6. What is the role of derivative control?
7. Why is sampling time important in digital control?
8. What is the difference between speed control and position control?
9. Why do practical controllers need output saturation?
10. What information should be included in a laboratory report?
