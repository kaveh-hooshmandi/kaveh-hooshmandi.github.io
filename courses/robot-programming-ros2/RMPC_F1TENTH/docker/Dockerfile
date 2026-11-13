# Building this file downloads and installs dependencies INSIDE a new image.
# Do not build until the user approves the installation plan in README.md.
FROM osrf/ros:humble-desktop-full
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive
ARG LOCAL_UID=1000
ARG LOCAL_GID=1000
ARG BRIDGE_COMMIT=08395766c4d9dc5a763381f1dd6fa4a3d68df66e
ARG GYM_COMMIT=bdaec1420c3b0f103858d289866d0d4e2e597c30

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git build-essential python3-dev python3-pip python3-venv \
    python3-colcon-common-extensions python3-scipy \
    ros-humble-ackermann-msgs ros-humble-nav2-map-server \
    ros-humble-nav2-lifecycle-manager ros-humble-foxglove-bridge \
    ros-humble-xacro ros-humble-robot-state-publisher \
    ros-humble-joint-state-publisher ros-humble-teleop-twist-keyboard \
    libgl1 libegl1 libxkbcommon-x11-0 libxcb-cursor0

# CUDA compiler/runtime/cuRAND only; no NVIDIA host driver installation.
RUN curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb \
      -o /tmp/cuda-keyring.deb \
    && dpkg -i /tmp/cuda-keyring.deb \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       cuda-nvcc-12-4 cuda-cudart-dev-12-4 libcurand-dev-12-4
ENV PATH=/usr/local/cuda-12.4/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64:${LD_LIBRARY_PATH}
ENV CUDACXX=/usr/local/cuda-12.4/bin/nvcc

COPY docker/python-constraints.txt /tmp/python-constraints.txt
RUN mkdir -p /sim_ws/src /rmpc_ws/src \
    && python3 -m venv --system-site-packages /sim_ws/.venv \
    && /sim_ws/.venv/bin/python -m pip install 'pip<26' 'setuptools<81' wheel cmake==3.31.6

RUN git init /sim_ws/src/f1tenth_gym_ros \
    && cd /sim_ws/src/f1tenth_gym_ros \
    && git remote add origin https://github.com/f1tenth/f1tenth_gym_ros.git \
    && git fetch --depth 1 origin ${BRIDGE_COMMIT} && git checkout --detach FETCH_HEAD \
    && git init /sim_ws/f1tenth_gym && cd /sim_ws/f1tenth_gym \
    && git remote add origin https://github.com/f1tenth/f1tenth_gym.git \
    && git fetch --depth 1 origin ${GYM_COMMIT} && git checkout --detach FETCH_HEAD \
    && /sim_ws/.venv/bin/python -m pip install -c /tmp/python-constraints.txt \
       -e /sim_ws/f1tenth_gym 'matplotlib>=3.8,<3.10'

WORKDIR /sim_ws
RUN source /opt/ros/humble/setup.bash \
    && source /sim_ws/.venv/bin/activate \
    && python3 -m colcon build --symlink-install

COPY src/rmpc_f1tenth /rmpc_ws/src/rmpc_f1tenth
WORKDIR /rmpc_ws
# RTX 3050 is compute capability 8.6. Explicit architecture works without GPU
# access during docker build, unlike CMAKE_CUDA_ARCHITECTURES=native.
RUN source /opt/ros/humble/setup.bash \
    && source /sim_ws/.venv/bin/activate \
    && source /sim_ws/install/setup.bash \
    && CMAKE_BUILD_PARALLEL_LEVEL=2 python3 -m colcon build \
       --packages-select rmpc_f1tenth --cmake-args \
       -DCMAKE_BUILD_TYPE=Release -DCMAKE_CUDA_ARCHITECTURES=86 \
       -DCMAKE_CUDA_COMPILER=/usr/local/cuda-12.4/bin/nvcc \
       -DBUILD_TESTING=OFF -DRMPC_BUILD_EXAMPLES=OFF

RUN /sim_ws/.venv/bin/python -m pip freeze > /sim_ws/python-freeze.txt \
    && (getent group ${LOCAL_GID} || groupadd -g ${LOCAL_GID} rmpc) \
    && useradd -m -u ${LOCAL_UID} -g ${LOCAL_GID} -s /bin/bash rmpc \
    && chown -R ${LOCAL_UID}:${LOCAL_GID} /sim_ws /rmpc_ws
COPY docker/entrypoint.sh /usr/local/bin/rmpc-entrypoint
RUN chmod 755 /usr/local/bin/rmpc-entrypoint
USER rmpc
WORKDIR /rmpc_ws
ENTRYPOINT ["/usr/local/bin/rmpc-entrypoint"]
CMD ["sleep", "infinity"]
