---
title: "Applied Control Systems - Slides"
permalink: /courses/control-systems/slides/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Slide Deck Outlines

This page provides lecture slide outlines. Each deck is written in a PowerPoint-friendly structure: title, learning goals, core theory, worked example, practical activity, and summary.

## Deck 1 — Introduction to Feedback Control

1. Course title and motivation
2. Real engineering examples: motor speed, robot navigation, temperature control
3. Open-loop control
4. Closed-loop control
5. Feedback loop components
6. Error signal and correction
7. Why feedback improves robustness
8. Practical example: motor speed error
9. Class activity: draw a control loop
10. Summary and quiz questions

## Deck 2 — Modelling Dynamic Systems

1. Why models are needed
2. Input, output, state, disturbance
3. First-order process model
4. Time constant and gain
5. DC motor modelling concept
6. Thermal plant modelling concept
7. From differential equation to transfer function
8. Simulation task
9. Practical limitations of models
10. Summary

## Deck 3 — Transfer Functions and Block Diagrams

1. Transfer function definition
2. Laplace-domain thinking
3. Series blocks
4. Parallel blocks
5. Feedback blocks
6. Closed-loop transfer function
7. Worked block-reduction example
8. Simulation activity
9. Common mistakes
10. Summary

## Deck 4 — Transient Response

1. What is transient response?
2. Step input as a test signal
3. Rise time
4. Peak time
5. Percent overshoot
6. Settling time
7. Damping ratio
8. Natural frequency
9. Practical response comparison
10. Summary

## Deck 5 — Stability

1. Meaning of stability
2. Stable, marginal, unstable responses
3. Poles and stability
4. Characteristic equation
5. Routh-Hurwitz idea
6. Worked Routh example
7. Stability before implementation
8. Safety in laboratory control
9. Quiz
10. Summary

## Deck 6 — Root Locus

1. Why root locus is useful
2. Gain and closed-loop pole movement
3. Root-locus sketching concept
4. Dominant pole approximation
5. Gain selection
6. Overshoot and damping relation
7. Practical tuning warning
8. Worked example
9. Activity
10. Summary

## Deck 7 — Frequency Response

1. Frequency-domain view
2. Sinusoidal response
3. Bode magnitude plot
4. Bode phase plot
5. Bandwidth
6. Gain margin
7. Phase margin
8. Noise and high-frequency gain
9. Practical example
10. Summary

## Deck 8 — PID Control

1. PID motivation
2. Proportional action
3. Integral action
4. Derivative action
5. P vs PI vs PID
6. Steady-state error reduction
7. Overshoot and damping
8. Anti-windup
9. Tuning activity
10. Summary

## Deck 9 — Digital Control

1. Digital implementation motivation
2. Sampling time
3. Discrete-time loop
4. Discrete PID formula
5. Sensor scaling
6. Output saturation
7. Timing jitter
8. Embedded pseudo-code
9. Testing checklist
10. Summary

## Deck 10 — DC Motor Control

1. DC motor control overview
2. PWM actuation
3. Encoder feedback
4. Speed estimation
5. Speed control loop
6. Position control loop
7. Cascade control concept
8. Lab activity
9. Troubleshooting guide
10. Summary

## Deck 11 — Embedded Control

1. Why embedded implementation matters
2. ADC input
3. Timer interrupt
4. PWM output
5. Real-time constraints
6. Safety limits
7. Debugging methods
8. STM32/Arduino example
9. Practical checklist
10. Summary

## Deck 12 — Robotics Motion Control

1. Mobile robot control problem
2. Differential-drive kinematics
3. Wheel speed control
4. Heading control
5. Trajectory tracking concept
6. ROS2 node structure
7. Sensor feedback
8. Final project guidance
9. Presentation preparation
10. Course summary

## Downloadable Markdown slide templates

- [Week 1 slide template](/courses/control-systems/slides/week01.md)
- [Week 8 slide template](/courses/control-systems/slides/week08.md)
- [Week 10 slide template](/courses/control-systems/slides/week10.md)
