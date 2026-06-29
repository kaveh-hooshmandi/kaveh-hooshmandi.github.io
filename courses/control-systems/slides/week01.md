---
title: "Week 1 Slides - Introduction to Feedback Control"
permalink: /courses/control-systems/slides/week01.md
layout: single
author_profile: true
---

# Week 1 Slide Template: Introduction to Feedback Control

## Slide 1 — Title
Applied Control Systems: Introduction to Feedback Control

## Slide 2 — Learning goals
By the end of this lecture, students should be able to define open-loop and closed-loop control, identify the main components of a feedback loop, and explain why feedback is useful in engineering systems.

## Slide 3 — Motivation
Control systems are used in robotics, automation, manufacturing, vehicles, drones, medical devices, and energy systems.

## Slide 4 — Open-loop control
An open-loop controller sends a command without measuring the output.

Example: A toaster heats for a fixed time.

## Slide 5 — Closed-loop control
A closed-loop controller measures the output and corrects the command using feedback.

Example: A motor speed controller uses encoder feedback.

## Slide 6 — Feedback loop components
Reference, error, controller, actuator, plant, sensor, output, disturbance.

## Slide 7 — Error signal
error = reference - measured output

The controller uses the error to decide the control action.

## Slide 8 — Engineering example
Reference motor speed = 1000 rpm. Measured speed = 850 rpm. Error = 150 rpm.

## Slide 9 — Class activity
Draw the feedback loop for a line-following robot.

## Slide 10 — Summary
Feedback improves accuracy and disturbance rejection, but poor controller design can cause oscillation or instability.
