#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$ROOT_DIR"
export RMPC_HOSTNAME="$(hostname)"
export RMPC_XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"
dc() {
  local files=(-f "$ROOT_DIR/compose.yaml")
  if [[ -f "$ROOT_DIR/compose.local.yaml" ]]; then
    files+=(-f "$ROOT_DIR/compose.local.yaml")
  fi
  docker compose "${files[@]}" "$@"
}
inside() {
  if [[ -t 0 && -t 1 ]]; then
    dc exec stack /usr/local/bin/rmpc-entrypoint "$@"
  else
    dc exec -T stack /usr/local/bin/rmpc-entrypoint "$@"
  fi
}
case "${1:-help}" in
  check)
    docker version --format '{{.Server.Version}}'
    docker compose version
    docker image inspect osrf/ros:humble-desktop-full --format 'Humble image: {{.Id}}'
    nvidia-smi --query-gpu=name,compute_cap --format=csv,noheader
    if docker image inspect jamris-rmpc-f1tenth:local >/dev/null 2>&1; then
      echo 'Project image exists. Run ./run.sh verify after ./run.sh up.'
    else
      echo 'Project image is NOT built; dependency installation still needs approval.'
    fi
    ;;
  build)
    if [[ "${2:-}" != --install-approved ]]; then
      echo 'This installs container dependencies. Obtain approval, then use:' >&2
      echo './run.sh build --install-approved' >&2
      exit 2
    fi
    docker image inspect osrf/ros:humble-desktop-full >/dev/null
    docker build --pull=false -f docker/Dockerfile \
      --build-arg "LOCAL_UID=$(id -u)" --build-arg "LOCAL_GID=$(id -g)" \
      -t jamris-rmpc-f1tenth:local .
    ;;
  up)
    docker image inspect jamris-rmpc-f1tenth:local >/dev/null 2>&1 || {
      echo 'Project image missing. Installation approval and build are required first.' >&2
      exit 2
    }
    [[ -n "${DISPLAY:-}" && -r "$RMPC_XAUTHORITY" ]] || {
      echo 'Run from a desktop terminal with DISPLAY and a readable XAUTHORITY.' >&2
      exit 2
    }
    dc up -d --no-build --pull never
    ;;
  sim)
    case "${2:-clear}" in
      clear) cfg=/project/config/sim.yaml ;;
      obstacles) cfg=/project/config/sim_obstacles.yaml ;;
      f1) cfg=/project/config/sim_f1_style.yaml ;;
      *) echo 'Use: ./run.sh sim [clear|obstacles|f1]' >&2; exit 2 ;;
    esac
    inside ros2 launch f1tenth_gym_ros gym_bridge_launch.py "config:=$cfg" open_foxglove:=false
    ;;
  launch)
    case "${2:-f1}" in
      f1|clear|obstacles) track="${2:-f1}" ;;
      *) echo 'Use: ./run.sh launch [f1|clear|obstacles] [--no-rviz] [--record]' >&2; exit 2 ;;
    esac
    show_rviz=true
    record=false
    for option in "${@:3}"; do
      case "$option" in
        --no-rviz) show_rviz=false ;;
        --record) record=true ;;
        *) echo 'Use: ./run.sh launch [f1|clear|obstacles] [--no-rviz] [--record]' >&2; exit 2 ;;
      esac
    done
    "$ROOT_DIR/run.sh" up
    inside ros2 launch /project/launch/all_in_one.launch.py "track:=$track" "rviz:=$show_rviz" "record:=$record"
    ;;
  controller)
    case "${2:-clear}" in
      clear|obstacles) cfg=/project/config/controller.yaml ;;
      f1) cfg=/project/config/f1_style_controller.yaml ;;
      *) echo 'Use: ./run.sh controller [clear|obstacles|f1]' >&2; exit 2 ;;
    esac
    inside ros2 run rmpc_f1tenth rmpc_node --ros-args --params-file "$cfg"
    ;;
  rviz)
    inside rviz2 -d /project/config/rviz-compatible.rviz
    ;;
  map-activate)
    state="$(inside ros2 lifecycle get /map_server)"
    if [[ "$state" == unconfigured* ]]; then
      inside ros2 lifecycle set /map_server configure
      state="$(inside ros2 lifecycle get /map_server)"
    fi
    if [[ "$state" == inactive* ]]; then
      inside ros2 lifecycle set /map_server activate
    elif [[ "$state" == active* ]]; then
      echo 'Map server is already active.'
    else
      echo "Unexpected map server state: $state" >&2; exit 2
    fi
    ;;
  record)
    bag="run_$(TZ=America/New_York date +%Y%m%d_%H%M%S)"
    inside ros2 bag record -o "/data/telemetry/$bag" /ego_racecar/odom /drive
    ;;
  analyze)
    bag="${2:?Usage: ./run.sh analyze BAG_DIRECTORY clear|obstacles|f1}"
    [[ "$bag" != *'/'* && "$bag" != '.' && "$bag" != '..' && -d "telemetry/$bag" ]] || {
      echo 'Supply one existing directory name under telemetry/.' >&2; exit 2;
    }
    case "${3:-}" in
      clear) obs=no ;;
      obstacles) obs=yes ;;
      f1) obs=no ;;
      *) echo 'Choose clear, obstacles, or f1.' >&2; exit 2 ;;
    esac
    if [[ "${3:-}" == f1 ]]; then
      centerline=/rmpc_ws/install/rmpc_f1tenth/share/rmpc_f1tenth/maps/F1_STYLE/F1_STYLE_centerline.csv
    else
      centerline=/rmpc_ws/install/rmpc_f1tenth/share/rmpc_f1tenth/maps/IMS/IMS_centerline.csv
    fi
    inside python3 /rmpc_ws/src/rmpc_f1tenth/scripts/evaluation_suite.py \
      --bag_path "/data/telemetry/$bag" \
      --centerline "$centerline" \
      --window 120 --filename "$bag" --obstacles "$obs"
    ;;
  plot-f1)
    bag="${2:?Usage: ./run.sh plot-f1 BAG_DIRECTORY}"
    [[ "$bag" == run_* && "$bag" != *'/'* && -d "telemetry/$bag" ]] || {
      echo 'Supply one F1_STYLE bag directory under telemetry/.' >&2; exit 2;
    }
    dc exec -T stack /usr/local/bin/rmpc-entrypoint python3 - "$bag" < "$ROOT_DIR/scripts/plot_f1_bag.py"
    ;;
  benchmark-build)
    # Recompile project code with tools already present; no package installation.
    dc cp "$ROOT_DIR/src/rmpc_f1tenth/src/." stack:/rmpc_ws/src/rmpc_f1tenth/src/
    dc cp "$ROOT_DIR/src/rmpc_f1tenth/include/." stack:/rmpc_ws/src/rmpc_f1tenth/include/
    inside cmake --build /rmpc_ws/build/rmpc_f1tenth --target rmpc_node -j2 > "$ROOT_DIR/experiments/build.log" 2>&1
    tail -3 "$ROOT_DIR/experiments/build.log"
    ;;
  benchmark)
    scenario="${2:?Usage: ./run.sh benchmark nominal|slippery OUTPUT_NAME}"
    output="${3:?Choose a new output directory name under experiments/}"
    [[ "$output" =~ ^[A-Za-z0-9_-]+$ ]] || { echo 'Invalid output name.' >&2; exit 2; }
    extra=()
    case "$scenario" in
      nominal) ;;
      slippery) extra=(--slippery) ;;
      *) echo 'Choose nominal or slippery.' >&2; exit 2 ;;
    esac
    inside python3 /project/experiments/run_study.py --output "/project/experiments/$output" --seeds 10 "${extra[@]}"
    ;;
  report)
    inside python3 /project/experiments/summarize_study.py
    ;;
  verify)
    inside bash -c 'nvidia-smi --query-gpu=name --format=csv,noheader && nvcc --version && cmake --version && ros2 pkg prefix rmpc_f1tenth && ros2 pkg prefix f1tenth_gym_ros && python3 -c "import f1tenth_gym, rclpy, numpy; print(\"Imports OK; NumPy\", numpy.__version__)"'
    ;;
  topics) inside ros2 topic list ;;
  shell) inside bash ;;
  down) dc down ;;
  *) echo 'Commands: check | build --install-approved | up | verify | launch [f1|clear|obstacles] [--no-rviz] [--record] | sim [clear|obstacles|f1] | controller [clear|obstacles|f1] | map-activate | rviz | record | analyze BAG clear|obstacles|f1 | plot-f1 BAG | benchmark-build | benchmark nominal|slippery OUTPUT_NAME | report | topics | shell | down' ;;
esac
