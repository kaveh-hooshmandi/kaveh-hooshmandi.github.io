---
title: "Applied Control Systems - Lectures"
permalink: /courses/control-systems/lectures/
layout: single
author_profile: true
---

<link rel="stylesheet" href="/assets/css/control-course.css">

# Weekly Lectures

## Week 1 — Introduction to Feedback Control

**Key idea:** A closed-loop system uses measurement and feedback to reduce error between the desired output and the actual output.

**Topics**
- Open-loop vs closed-loop control
- Reference, output, error, controller, actuator, plant, sensor
- Examples: room temperature, motor speed, mobile robot velocity

**Worked example**
A motor is commanded to rotate at 1000 rpm. The measured speed is 850 rpm. The feedback error is:

`error = reference - measurement = 1000 - 850 = 150 rpm`

**Mini activity**
Draw the control loop for a line-following robot and identify the sensor, controller, actuator, and plant.

---

## Week 2 — Mathematical Modelling of Dynamic Systems

**Key idea:** A physical system can be represented by differential equations and converted into a transfer function for analysis.

**Topics**
- First-order systems
- Second-order systems
- DC motor model
- Thermal process model

**Example model**
For a simple first-order process:

`tau dy/dt + y = K u`

where `tau` is the time constant and `K` is the static gain.

---

## Week 3 — Transfer Functions and Block Diagrams

**Key idea:** Transfer functions describe the input-output relationship of linear time-invariant systems in the Laplace domain.

**Topics**
- Laplace-domain representation
- Transfer function `G(s) = Y(s)/U(s)`
- Block diagram reduction
- Series, parallel, and feedback connections

**Practical link**
Use MATLAB or Python to simulate the step response of a first-order and second-order plant.

---

## Week 4 — Transient Response

**Key idea:** Transient response tells us how fast and how accurately a control system responds after a change in input.

**Performance measures**
- Rise time
- Peak time
- Percent overshoot
- Settling time
- Steady-state error
- Natural frequency and damping ratio

**Lab link**
Compare an underdamped response with an overdamped response and explain which is better for a positioning system.

---

## Week 5 — Stability and Routh-Hurwitz Criterion

**Key idea:** A controller is only useful if the closed-loop system remains stable.

**Topics**
- Poles and stability
- Characteristic equation
- Routh table
- Stability margin concept

**Mini task**
Determine whether the polynomial `s^3 + 4s^2 + 5s + 2` is stable using a Routh table.

---

## Week 6 — Root Locus Design

**Key idea:** Root locus shows how closed-loop poles move as controller gain changes.

**Topics**
- Root locus concept
- Dominant poles
- Gain selection
- Transient performance connection

**Engineering question**
How does increasing proportional gain affect speed of response, overshoot, and stability risk?

---

## Week 7 — Frequency Response and Bode Plots

**Key idea:** Frequency response helps evaluate bandwidth, gain margin, phase margin, and robustness.

**Topics**
- Sinusoidal input response
- Bode magnitude and phase plots
- Bandwidth
- Gain margin and phase margin

**Practical link**
Estimate the usable control bandwidth of a motor system before noise amplification becomes a problem.

---

## Week 8 — PID Control

**Key idea:** PID control combines proportional, integral, and derivative actions to improve tracking and disturbance rejection.

**Topics**
- Proportional action and steady-state error
- Integral action and offset removal
- Derivative action and damping
- PID tuning methods
- Anti-windup and derivative filtering

**Controller form**
`u(t) = Kp e(t) + Ki integral(e(t)) + Kd de(t)/dt`

---

## Week 9 — Digital Control and Sampling

**Key idea:** Real controllers are often implemented digitally, so sampling time and discrete approximation matter.

**Topics**
- Sampling time
- Discrete PID
- Zero-order hold concept
- Quantisation and sensor noise
- Real-time loop structure

**Pseudo-code**
```c
error = reference - measurement;
integral = integral + error * Ts;
derivative = (error - previous_error) / Ts;
u = Kp*error + Ki*integral + Kd*derivative;
previous_error = error;
```

---

## Week 10 — DC Motor Speed and Position Control

**Key idea:** Motor control is a central application of feedback control in robotics and automation.

**Topics**
- PWM control
- Encoder feedback
- Speed estimation
- Position loop vs speed loop
- Servo control structure

**Practical link**
Implement a speed controller first, then use it inside a higher-level position controller.

---

## Week 11 — Embedded Control Implementation

**Key idea:** A controller must be implemented with correct timing, safe limits, sensor reading, and actuator output.

**Topics**
- ADC input
- Timer interrupt
- PWM output
- Saturation limits
- Debugging embedded control loops

**Engineering checklist**
Check sampling time, sensor scaling, output saturation, and emergency stop before closing the loop.

---

## Week 12 — Robotics Motion Control Project

**Key idea:** Mobile robot control combines modelling, feedback, embedded software, sensors, and system testing.

**Topics**
- Differential-drive robot kinematics
- Wheel speed control
- Heading control
- Trajectory tracking concept
- ROS2-based system architecture

**Final activity**
Design a controller for one robotic or industrial automation system and present the performance results.
