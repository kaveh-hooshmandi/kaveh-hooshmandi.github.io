---
title: "Week 8 Slides - PID Control"
permalink: /courses/control-systems/slides/week08.md
layout: single
author_profile: true
---

# Week 8 Slide Template: PID Control

## Slide 1 — Title
PID Control: From Theory to Tuning

## Slide 2 — Learning goals
Explain P, I, and D actions; tune a basic controller; compare P, PI, and PID performance.

## Slide 3 — Why PID?
PID is widely used because it is simple, practical, and effective for many industrial systems.

## Slide 4 — Proportional action
Proportional control reacts to the present error.

u = Kp e

Increasing Kp usually improves speed but can increase overshoot.

## Slide 5 — Integral action
Integral control reacts to accumulated error and helps remove steady-state error.

Too much integral action can cause windup and oscillation.

## Slide 6 — Derivative action
Derivative control reacts to rate of change of error and can improve damping.

Derivative action is sensitive to noise.

## Slide 7 — PID formula
u(t) = Kp e(t) + Ki integral(e(t)) + Kd de(t)/dt

## Slide 8 — Tuning strategy
Start with P, add I to reduce offset, add D only if damping improvement is needed.

## Slide 9 — Practical issues
Saturation, anti-windup, derivative filtering, sensor noise, and sampling time.

## Slide 10 — Activity
Tune a PID controller for a first-order or motor-speed system and compare response plots.
