---
title: "Applied Control Systems - Labs"
permalink: /courses/control-systems/labs/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Practical Laboratory Work

Each lab is designed to assess process as well as final result: setup, safety, data collection, troubleshooting, interpretation, and reporting.

## Lab 1 — First-Order System Identification

**Goal:** Estimate the gain and time constant of a first-order plant from step-response data.

**Equipment / tools:** Python or MATLAB; optional thermal process or simulated plant.

**Tasks**
1. Apply a step input to the plant.
2. Record output data.
3. Estimate steady-state gain `K`.
4. Estimate time constant `tau` using the 63.2% method.
5. Compare measured and simulated responses.

**Deliverable:** One-page lab report with graph, parameter estimates, and comments.

---

## Lab 2 — Transient Response of a Second-Order System

**Goal:** Analyse underdamped, critically damped, and overdamped responses.

**Tasks**
1. Simulate three second-order systems with different damping ratios.
2. Measure overshoot, rise time, and settling time.
3. Explain which response is suitable for a robotic position-control system.

---

## Lab 3 — PID Tuning for a Process System

**Goal:** Tune P, PI, and PID controllers and compare performance.

**Tasks**
1. Start with proportional control.
2. Add integral action to reduce steady-state error.
3. Add derivative action to improve damping.
4. Compare the results using rise time, overshoot, settling time, and steady-state error.

**Assessment focus:** Students must justify their gain choices.

---

## Lab 4 — Digital PID Implementation

**Goal:** Implement a digital PID controller in code.

**Tools:** C, STM32 or Arduino, or a simulated embedded loop.

**Core code structure**
```c
float PID_Update(float ref, float y)
{
    float e = ref - y;
    integral += e * Ts;
    float derivative = (e - e_prev) / Ts;
    float u = Kp*e + Ki*integral + Kd*derivative;
    e_prev = e;
    return u;
}
```

**Safety requirement:** Apply saturation limits to the controller output.

---

## Lab 5 — DC Motor Speed Control

**Goal:** Control motor speed using feedback from an encoder.

**Tasks**
1. Read encoder pulses.
2. Estimate speed.
3. Generate PWM output.
4. Tune a PI speed controller.
5. Test disturbance rejection by applying a load change.

**Report question:** Why is PI control often preferred over pure P control for speed regulation?

---

## Lab 6 — Mobile Robot Motion Control

**Goal:** Design a simple velocity or heading controller for a differential-drive robot.

**Tools:** ROS2 simulation, Python, or physical robot platform.

**Tasks**
1. Define reference velocity or heading.
2. Read simulated odometry.
3. Compute error.
4. Apply a feedback controller.
5. Plot tracking performance.

**Final reflection:** Discuss how sensor noise and actuator saturation affect real robot performance.
