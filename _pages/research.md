---
layout: single
title: "Projects"
permalink: /research/
author_profile: true
---



<div class="project-container">


  <div class="project-row">
    <div class="project-description">
      <h2>Color-Based Object Sorting with PincherX-100 Arm</h2>
      <p>This project focuses on developing an autonomous color-sorting system that integrates perception and manipulation using a PincherX100 robotic arm and an Intel RealSense D415 stereo camera within a ROS-based framework. The main goal was to enable the robot to detect, localize, and sort objects based on their colors in real time. The methodology began with object detection using camera data, followed by transforming the detected object positions from the camera frame to the robot’s coordinate frame. An HSV color space approach was used to robustly classify objects by color under varying lighting conditions. The ROS interface facilitated communication between perception and control modules, allowing seamless execution of robot position commands. Finally, the system successfully demonstrated accurate color-based sorting, highlighting the effectiveness of integrating vision, transformation, and control in a robotic manipulation task.</p>
    </div>
    <div class="project-image">
      <img src="/images/color_sort_final.gif" alt="Project 1 Image" style='width:60%;'/>
    </div>
  </div>



  
  <div class="project-row">
    <div class="project-description">
      <h2>Optimization-Based Control in Safety-Critical Systems with Limited Computing Capacity</h2>
      <p>Publications:

“Steady-State-Aware Model Predictive Control for Tracking in Systems With Limited Computing Capacity”, IEEE Control Systems Letters, 2024.
“Closed-Loop Model Identification and MPC-based Navigation of Quadcopters: A Case Study of Parrot Bebop 2”, in Proc. 4th Modeling, Estimation, and Control Conference, 2024.</p>
    </div>
    <div class="project-image">
      <img src="/images/MPC.jpg" alt="Project 1 Image" style='width:60%;'/>
    </div>
  </div>

  <div class="project-row">
    <div class="project-description">
      <h2>Safe and Efficient Robot Interaction Planning in the Presence of Unconcerned Human</h2>
      <p>When developing action planning for robots that interact with
humans, accurately predicting human actions is essential, as humans also
predict the robot’s actions in HRI environments. By taking human predictions into account, robots can improve their ability to predict human actions
(left figure). Ignoring this aspect of human behavior can result in inaccurate
predictions and reduced efficiency by causing the robot to deviate from its
optimal path (right figure).</p>
    </div>
    <div class="project-image">
      <img src="/images/HRI.png" alt="Project 2 Image" style='width:60%;'/>
    </div>
  </div>

<div class="project-row">
  <div class="project-description">

        <h2>Closed-Loop Model Identification and MPC-based Navigation of Quadcopters: A Case Study of Parrot Bebop 2</h2>
    <p>The growing potential of quadcopters in various domains, such as aerial photography, search and rescue, and infrastructure inspection, underscores the need for real-time control under strict safety and operational constraints. This challenge is compounded by the inherent nonlinear dynamics of quadcopters and the on-board computational limitations they face.
The question is how to address these challenges.</p>
  </div>
  <div class="project-video">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/DROqNThat3k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

  </div>
</div>

    <h2>Implementation of Model-Based Controllers on Drones and Rovers in Real-World Scenarios</h2>
    <p>Implementing model-based controllers on drones and rovers within real-world scenarios through a multi-agent ROS-based remote network. Key components include establishing a network for mobile robots, implementing a human leg tracker using RPLiDar, and developing a probabilistically safe robot planner on the Locobot WX250s. Additional efforts involve creating a robust-to-early termination model predictive control strategy validated through MATLAB simulations, and deploying a steady-state-aware controller on the Parrot Bebop 2 drone. The research also integrates SLAM for navigation and mapping using lidar and depth camera technologies, aiming to enhance the performance and safety of mobile robotics.</p>
  </div>
  <div class="project-video">
   <iframe width="560" height="315" src="https://www.youtube.com/embed/taRNRWsa-es" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

  </div>
</div>

