# RMPC F1TENTH: simulation and reproducible evaluation

**Maintainer and paper author:** Kaveh Hooshmandi, Arak University of Technology, [k.hooshmandi@arakut.ac.ir](mailto:k.hooshmandi@arakut.ac.ir).

This project packages a GPU accelerated RMPC controller for the F1TENTH simulator, an original circuit, recorded runs, and a controlled comparison with Pure Pursuit. See [NOTICE.md](NOTICE.md) for authorship and reuse terms.

![Simplified F1-style circuit and recorded lateral response](paper/figures/local_f1_track_response.png)

The circuit is an original design inspired by Yas Marina, not official track geometry. The lateral value in the plot is signed **Frenet offset from the centerline**, not global map y.

## Run everything from one terminal

With the project Docker image already built, open a desktop terminal in this project directory:

```bash
./run.sh launch f1
```

This ROS 2 launch starts the F1TENTH simulator, GPU RMPC controller, map server, Foxglove bridge, and RViz. Press **Ctrl+C** to stop the launched processes. The Docker service stays available; use `./run.sh down` when finished.

```bash
./run.sh launch f1 --no-rviz  # omit RViz
./run.sh launch f1 --record   # also save odometry and drive to a ROS bag
./run.sh launch clear         # original IMS track
./run.sh launch obstacles     # IMS with obstacles
```

The `--record` option saves a new UTC-stamped directory under `telemetry/`. `launch/all_in_one.launch.py` combines the ROS components. The commands were tested on this workstation with an RTX 3050; a short recorded run produced a valid bag with both requested topics.

## Requirements and installation

These instructions are for **x86_64 Ubuntu 22.04 or 24.04 with an X11 desktop and an NVIDIA GPU**. The host needs Docker Engine, the Docker Compose plugin, an NVIDIA driver, and NVIDIA Container Toolkit. The build also needs internet access to download the base image, packages, and pinned simulator versions. ROS 2 Humble and CUDA 12.4 are installed inside the project image. Install the NVIDIA driver on the host first and confirm that `nvidia-smi` detects the GPU. See the [official NVIDIA driver guide](https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/ubuntu.html) for your GPU and Ubuntu version.

### 1. Install Docker Engine and Compose

If Docker Engine and the Compose plugin already work, skip this step. Otherwise, add Docker's official package source and install the packages ([Docker installation guide](https://docs.docker.com/engine/install/ubuntu/)):

```bash
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources >/dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo docker run --rm hello-world
```

The `run.sh` script calls Docker without `sudo`. To grant your account access, run the following command, then **sign out of your desktop session and sign back in**. Membership in the `docker` group grants root-level privileges; see [Docker's explanation](https://docs.docker.com/engine/install/linux-postinstall/).

```bash
sudo usermod -aG docker "$USER"
```

After signing back in, `docker version` and `docker compose version` should work without `sudo`.

### 2. Install NVIDIA Container Toolkit

Once `nvidia-smi` works on the host, add NVIDIA's package source and configure its Docker runtime ([NVIDIA installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)):

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg2
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt update
sudo apt install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

### 3. Build and run the project

In an **X11 desktop terminal**, enter the `RMPC_F1TENTH` directory containing `run.sh`. The script needs the `DISPLAY` environment variable and a readable `XAUTHORITY` file (usually `~/.Xauthority`). Pull the ROS base image before running `check`, because `check` verifies that the image exists. If `jamris-rmpc-f1tenth:local` is already present, skip the `build` command. Then start and verify the project:

```bash
docker pull osrf/ros:humble-desktop-full
./run.sh check
./run.sh build --install-approved
./run.sh up
./run.sh verify
./run.sh launch f1
```

The build may take some time. `build --install-approved` installs dependencies **inside the Docker image**. The CUDA architecture in `docker/Dockerfile` is set to `86` for an RTX 3050; for another GPU, adjust `CMAKE_CUDA_ARCHITECTURES` before building. `./run.sh check` reports the Docker, Compose, base image, and GPU status. `./run.sh verify` checks CUDA, ROS packages, and Python imports inside the running container. After `launch` starts, press **Ctrl+C** to stop the programs, then stop the project service:

```bash
./run.sh down
```

To run without RViz, use `./run.sh launch f1 --no-rviz`. If RViz has display issues, `compose.local.example.yaml` shows optional `/dev/dri` mappings. Copy it to `compose.local.yaml` only if your display needs them. The default Compose file already requests an NVIDIA GPU without fixed `/dev/dri` device numbers.

## Recorded run and figures

The archived F1-style run is `telemetry/run_20261112_115749/`. Two laps were detected: 63.696 s and 59.412 s; their mean is 61.554 s. Its recorded maximum absolute centerline offset is 0.662 m. This is **one asynchronous ROS run**, not a repeated-trial comparison. [The run report](reports/f1-style-run-summary.md) explains its scope.

After `./run.sh launch f1 --record` and Ctrl+C, use the new bag directory name:

```bash
./run.sh analyze BAG_DIRECTORY f1
./run.sh plot-f1 BAG_DIRECTORY
```

`analyze` writes metrics and general plots to `results/`. `plot-f1` writes the track and lateral-offset figure. `scripts/generate_f1_style_track.py` generates the original circuit; the map and centerline are under `src/rmpc_f1tenth/maps/F1_STYLE/`.

## Controlled comparison

The separate synchronous study evaluates Pure Pursuit and RMPC at 1,000, 2,500, and 5,000 samples on IMS and the new circuit, plus a synthetic low-grip sector. Its 100 archived trial traces are in `experiments/study_v1/` (80 nominal) and `experiments/slippery_v1/` (20 stress). See [the protocol](experiments/README.md) and [the fixed report](experiments/report/summary.md).

To run new trials after starting the container, choose fresh output directory names:

```bash
./run.sh down
./run.sh up
./run.sh benchmark-build
./run.sh benchmark nominal my_nominal_repeat
./run.sh benchmark slippery my_slippery_repeat
./run.sh report
```

`benchmark-build` compiles source already present in the image; it does not install packages. The report command currently reads archived `study_v1` and `slippery_v1`; edit its dataset paths to report newly named repeats. The study's timing covers synchronized solver calls, not ROS scheduling deadlines.
