---
title: "Week 10 Slides - DC Motor Control"
permalink: /courses/control-systems/slides/week10.md
layout: single
author_profile: true
---

# Week 10 Slide Template: DC Motor Speed and Position Control

## Slide 1 — Title
DC Motor Speed and Position Control

## Slide 2 — Learning goals
Understand PWM actuation, encoder feedback, speed estimation, and speed/position control loops.

## Slide 3 — Motor control in robotics
DC motors are used in wheels, joints, conveyors, and mechatronic actuators.

## Slide 4 — PWM actuation
PWM controls average voltage applied to the motor by changing duty cycle.

## Slide 5 — Encoder feedback
Encoders provide pulse counts that can be converted to speed or position.

## Slide 6 — Speed estimation
speed = change in encoder position / sampling time

## Slide 7 — Speed control loop
Reference speed, measured speed, error, PI controller, PWM output, motor, encoder.

## Slide 8 — Position control loop
Position control may use an outer position loop and an inner speed loop.

## Slide 9 — Practical limitations
Friction, dead zone, saturation, sensor resolution, noise, and sampling delay.

## Slide 10 — Lab task
Implement or simulate a PI speed controller and evaluate tracking and disturbance rejection.
