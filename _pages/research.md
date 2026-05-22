---
layout: single
title: "Projects"
permalink: /research/
author_profile: true
---

<style>
.project-container {
  width: 100%;
  margin-top: 20px;
}

.project-row {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  margin-bottom: 45px;
  padding-bottom: 35px;
  border-bottom: 1px solid #e0e0e0;
}

.project-description {
  flex: 1;
  min-width: 300px;
  padding-right: 25px;
}

.project-media {
  flex: 1;
  min-width: 300px;
  text-align: center;
}

.project-media img,
.project-media video,
.project-media iframe {
  max-width: 100%;
  border-radius: 8px;
}

.project-description h2 {
  margin-top: 0;
  color: #222;
}

.project-description p {
  text-align: justify;
  line-height: 1.7;
}

.project-description ul {
  line-height: 1.7;
}
</style>

<div class="project-container">

  <div class="project-row">
    <div class="project-description">
      <h2>Quadrotor Trajectory Control and Autonomous Navigation</h2>
      <p>
        This project focuses on trajectory tracking and control of quadrotor systems under nonlinear dynamics, model uncertainty, and real-world operational constraints. The main objective is to design and implement control strategies that enable a quadrotor to follow desired trajectories accurately while maintaining stability, safety, and robustness against disturbances.
      </p>

      <p>
        The work is based on advanced control-system design, dynamic modeling, simulation, and validation using MATLAB/Simulink and robotics-oriented implementation tools. The project includes trajectory generation, position and attitude control, feedback stabilization, tracking-error analysis, and performance evaluation under uncertain conditions.
      </p>

      <ul>
        <li>Quadrotor dynamic modeling and simulation</li>
        <li>Trajectory tracking control</li>
        <li>Position and attitude stabilization</li>
        <li>Robustness against model uncertainty and disturbances</li>
        <li>MATLAB/Simulink-based controller design and validation</li>
        <li>Extension toward autonomous navigation and landing</li>
      </ul>
    </div>

    <div class="project-media">
      <video width="100%" controls>
        <source src="/videos/k.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>ROS2-Based Autonomous Mobile Robot Platform</h2>
      <p>
        This project presents the development of an autonomous mobile robot platform for research and industrial applications. The system is designed around a ROS2-based architecture and integrates perception, localization, navigation, and motion control modules for autonomous operation in structured and semi-structured environments.
      </p>

      <p>
        The platform combines LiDAR, IMU, wheel encoders, motor drivers, and embedded controllers to achieve reliable navigation and control. The project is closely related to GPS-denied localization, autonomous navigation, sensor fusion, and real-time robotic software implementation.
      </p>

      <ul>
        <li>ROS2-based robotic software architecture</li>
        <li>Autonomous mobile robot development</li>
        <li>LiDAR, IMU, and encoder integration</li>
        <li>Localization and navigation in GPS-denied environments</li>
        <li>Motion control and trajectory tracking</li>
        <li>Embedded implementation and hardware integration</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/amr-robot.jpg" alt="Autonomous Mobile Robot Project">
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>LiDAR Odometry, SLAM, and Sensor Fusion</h2>
      <p>
        This project focuses on localization and mapping for autonomous robotic systems using LiDAR-based perception, inertial measurements, and sensor-fusion techniques. The objective is to improve the accuracy and robustness of robot localization in environments where GPS is unavailable or unreliable.
      </p>

      <p>
        The research includes LiDAR odometry, scan matching, ICP-based registration, SLAM, and fusion of LiDAR, IMU, and encoder data. The project also involves custom implementation and evaluation using Python, C++, ROS/ROS2, and open-source mapping and localization frameworks.
      </p>

      <ul>
        <li>LiDAR-based odometry and localization</li>
        <li>ICP and point-cloud registration</li>
        <li>SLAM for autonomous mobile robots</li>
        <li>LiDAR/IMU/encoder sensor fusion</li>
        <li>ROS/ROS2 integration</li>
        <li>Evaluation of localization accuracy and robustness</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/lidar-slam.jpg" alt="LiDAR SLAM and Sensor Fusion Project">
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>Advanced Control of Nonlinear and Uncertain Systems</h2>
      <p>
        This project area focuses on the analysis, design, and implementation of advanced controllers for nonlinear and uncertain dynamical systems. The research includes robust control, adaptive control, intelligent control, observer design, and stability analysis for systems with modeling errors, disturbances, and parameter variations.
      </p>

      <p>
        The main goal is to bridge theoretical control-system design with practical implementation in robotic and mechatronic systems. This includes Lyapunov-based stability analysis, robust stabilization, tracking control, and simulation-based validation.
      </p>

      <ul>
        <li>Robust and adaptive control</li>
        <li>Nonlinear control-system design</li>
        <li>Lyapunov-based stability analysis</li>
        <li>Observer and state-estimation methods</li>
        <li>Tracking control for uncertain systems</li>
        <li>MATLAB/Simulink modeling and simulation</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/control-systems.jpg" alt="Advanced Control Systems Project">
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>Embedded Control and Real-Time Robotic Implementation</h2>
      <p>
        This project focuses on implementing control, estimation, and navigation algorithms on embedded hardware for robotic and intelligent systems. The work includes microcontroller-based implementation, sensor interfacing, real-time data acquisition, communication protocols, and hardware-software integration.
      </p>

      <p>
        Embedded platforms such as STM32, ESP32, Arduino, and TI C2000 DSP controllers are used for implementing real-time control algorithms, sensor fusion, motor control, and robotic navigation tasks.
      </p>

      <ul>
        <li>Embedded control-system implementation</li>
        <li>STM32, ESP32, Arduino, and TI C2000 platforms</li>
        <li>Sensor interfacing and real-time data acquisition</li>
        <li>CAN, SPI, I2C, UART, PWM, and ADC communication</li>
        <li>Motor control and actuator-level implementation</li>
        <li>Hardware-software integration for robotics</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/embedded-control.jpg" alt="Embedded Control Project">
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>Battery Management Systems and State Estimation</h2>
      <p>
        This project focuses on modeling, estimation, and control methods for battery management systems. The research includes state-of-charge estimation, state-of-health estimation, model-based filtering, capacity estimation, and real-time implementation of estimation algorithms for electric-vehicle and energy-storage applications.
      </p>

      <p>
        The project combines control theory, Kalman-filter-based estimation, battery modeling, and embedded implementation. The objective is to improve the reliability, accuracy, and safety of battery monitoring and management systems.
      </p>

      <ul>
        <li>State-of-charge estimation</li>
        <li>State-of-health and capacity estimation</li>
        <li>Kalman filter, EKF, and model-based estimation</li>
        <li>Battery pack modeling and simulation</li>
        <li>Embedded BMS implementation</li>
        <li>Fault detection and safety monitoring</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/bms-estimation.jpg" alt="Battery Management System Project">
    </div>
  </div>


  <div class="project-row">
    <div class="project-description">
      <h2>AI-Driven Robotics and Intelligent Autonomous Systems</h2>
      <p>
        This project area focuses on combining artificial intelligence, control engineering, and robotics to develop intelligent autonomous systems. The work includes learning-based control, perception-driven navigation, decision-making, and integration of AI algorithms with robotic platforms.
      </p>

      <p>
        The objective is to develop robotic systems that can perceive their environment, estimate their state, plan actions, and execute control commands in real time. This research direction supports future applications in autonomous mobile robots, industrial robotics, inspection robots, and intelligent service robots.
      </p>

      <ul>
        <li>AI-assisted robotic control</li>
        <li>Learning-based navigation and decision-making</li>
        <li>Computer vision and perception for robotics</li>
        <li>Sensor fusion and autonomous operation</li>
        <li>Integration of AI algorithms with ROS/ROS2</li>
        <li>Research-to-prototype robotic development</li>
      </ul>
    </div>

    <div class="project-media">
      <img src="/images/ai-robotics.jpg" alt="AI Robotics Project">
    </div>
  </div>

</div>
