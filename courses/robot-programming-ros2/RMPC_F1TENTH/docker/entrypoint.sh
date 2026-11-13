#!/usr/bin/env bash
set -e
source /opt/ros/humble/setup.bash
source /sim_ws/.venv/bin/activate
source /sim_ws/install/setup.bash
source /rmpc_ws/install/setup.bash
exec "$@"
