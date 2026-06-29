---
title: "Applied Control Systems - Projects"
permalink: /courses/control-systems/projects/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Final Project

The final project asks students to design, implement, test, and report a practical feedback control system.

## Project options

### Option A — DC Motor Speed Control

Design a PI controller for a DC motor speed-control system.

**Minimum requirements**
- Measure motor speed using encoder or simulated sensor.
- Generate PWM control input.
- Tune controller gains.
- Test tracking and disturbance rejection.
- Present plots of reference, speed, error, and control effort.

---

### Option B — DC Motor Position Control

Design a position controller for a motor or servo system.

**Minimum requirements**
- Use position feedback.
- Analyse overshoot and settling time.
- Compare P and PD/PID control.
- Discuss limitations caused by actuator saturation.

---

### Option C — Temperature Control System

Design an on/off, P, PI, or PID controller for a thermal process.

**Minimum requirements**
- Identify approximate plant dynamics.
- Tune the controller.
- Compare open-loop and closed-loop performance.
- Discuss delay, noise, and overshoot.

---

### Option D — Mobile Robot Heading Control

Design a heading or velocity controller for a differential-drive mobile robot.

**Minimum requirements**
- Use odometry or simulated sensor feedback.
- Compute heading or velocity error.
- Apply a feedback controller.
- Evaluate tracking performance.
- Discuss ROS2 implementation structure.

## Project report structure

1. Problem statement
2. System model or description
3. Controller design
4. Implementation method
5. Test procedure
6. Results and plots
7. Troubleshooting and limitations
8. Engineering conclusion

## Demonstration questions

During the project demonstration, students should be able to answer:

- Why did you choose this controller?
- How did you tune the gains?
- What was the main practical problem?
- How do the results compare with the theory?
- How would you improve the system in a real industrial application?
