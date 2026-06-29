function answerCourseQuestion() {
  const input = document.getElementById('courseQuestion').value.toLowerCase();
  const output = document.getElementById('courseAnswer');

  const answers = [
    {
      keys: ['open-loop', 'open loop', 'closed-loop', 'closed loop'],
      text: 'Open-loop control acts without measuring the output. Closed-loop control measures the output, compares it with the reference, and uses the error to correct the system. Closed-loop control is usually more robust to disturbances and modelling errors.'
    },
    {
      keys: ['overshoot', 'percent overshoot'],
      text: 'Overshoot is the amount by which the response exceeds its final desired value during the transient response. It is important in motion control because too much overshoot can cause vibration, mechanical stress, or positioning errors.'
    },
    {
      keys: ['settling', 'settling time'],
      text: 'Settling time is the time required for the output to remain within a specified tolerance band around the final value, commonly 2% or 5%.'
    },
    {
      keys: ['rise time', 'rise'],
      text: 'Rise time measures how quickly the output moves from a low percentage to a high percentage of its final value. It is a measure of response speed.'
    },
    {
      keys: ['pid', 'proportional', 'integral', 'derivative'],
      text: 'A PID controller uses proportional action for immediate correction, integral action to reduce steady-state error, and derivative action to improve damping. In practical tuning, start with P, add I if steady-state error remains, and add D carefully if overshoot or oscillation is too high.'
    },
    {
      keys: ['sampling', 'digital', 'discrete'],
      text: 'Sampling time is important because digital controllers only update at discrete instants. If the sampling time is too slow, the controller may react late and become inaccurate or unstable. If it is too fast, noise and processor load may become problems.'
    },
    {
      keys: ['lab report', 'report'],
      text: 'A good lab report should include the aim, equipment, setup diagram, method, data, plots, controller parameters, results, troubleshooting, interpretation, and a short engineering conclusion.'
    },
    {
      keys: ['motor', 'dc motor', 'encoder', 'pwm'],
      text: 'For DC motor control, use PWM as the actuator signal and encoder feedback to estimate speed or position. Start with speed control, then build position control if needed. Always include saturation limits for safe operation.'
    },
    {
      keys: ['robot', 'ros2', 'mobile robot', 'navigation'],
      text: 'For robotics motion control, identify the reference velocity or heading, measure the robot state using odometry or sensors, compute the tracking error, and apply a feedback controller. ROS2 can organise the system into sensor, controller, and actuator nodes.'
    },
    {
      keys: ['project', 'final project'],
      text: 'Suitable final projects include DC motor speed control, DC motor position control, temperature control, and mobile robot heading control. A strong project includes modelling, controller design, implementation, testing, plots, and discussion of limitations.'
    }
  ];

  for (const item of answers) {
    if (item.keys.some(k => input.includes(k))) {
      output.innerHTML = item.text;
      return;
    }
  }

  output.innerHTML = 'I can help with open-loop and closed-loop control, transient response, PID tuning, digital control, motor control, lab reports, and final projects. Try asking a more specific question using one of those keywords.';
}
