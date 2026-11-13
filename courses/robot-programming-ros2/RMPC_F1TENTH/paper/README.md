# JAMRIS RMPC simulation paper

`rmpc_f1tenth_jamris.tex` is a draft paper in the supplied JAMRIS class. The
author is Kaveh Hooshmandi, affiliated with Arak University of Technology,
with email `k.hooshmandi@arakut.ac.ir`. Publication metadata such as volume,
issue, and DOI remain draft placeholders.

For a portable public repository, the bundled JAMRIS class uses installed
Caladea, Carlito, and TeX Gyre Pagella fonts in place of the supplied
Cambria, Calibri, and Palatino font files. The class layout remains JAMRIS;
the source is typeset with substitute open fonts. The original font files
are not redistributed in this repository.

`controller_details.tex` is included by the main LaTeX file. It develops the
dynamic bicycle model, tire forces, IDCT sampling, actuator limits, cost
functions, and receding-horizon algorithm from Sections III--IV of
the 2025 IEEE IV paper by Muraleedharan et al. (provided separately as
`IV2025_arun.pdf`), distinguishing the full-scale formulation from the
actual F1TENTH code. Implementation equations were checked against the pinned
solver submodule `2c25f4b` (not an assumed reproduction of the full-scale
controller). The documented 7 m/s slip denominator floor, host-side candidate
selection, and callback-based speed slew limiter describe that revision.

`controlled_study.tex` adds the new 100-trial synchronous study. It reports a
Pure Pursuit steering baseline, three RMPC sample counts, and a low-grip
sector. The eight-row table and three figures are generated from
`../experiments/study_v1` and `../experiments/slippery_v1`; the raw per-step
traces, configurations, random seeds, hashes, reporting script, and numerical
summary are kept there. This is distinct from the earlier ROS bag case study.

The paper uses the public `rmpc-simulation` repository at revision `c5c190f`.
Its slalom image is copied from `results/bag_slalom_benchmark.png`. The two
requested RViz images are copied from `results/rviz_screenshot.png` and
`results/rviz_obstacles_screenshot.png`; the paper cites the repository and
its README for their interpretation. The raw ROS bags are not in that
repository, so the paper transcribes its published JSON summaries. Separately,
the paper includes a new local run on an original simplified Yas-Marina-inspired
circuit. Its generated map, configurations, raw bag `run_20261112_115749`,
analysis script, and numerical summary are in the repository root. The combined
track and lateral-response figure is copied from that run's `results` folder.
In both the source slalom and the local figure, lateral `y` means Frenet
offset `d(t)`, not global map y.

To regenerate the controller diagram and new circuit figure, then compile the paper:

```sh
python3 make_figures.py
latexmk -xelatex -bibtex rmpc_f1tenth_jamris.tex
```

Run these commands in this directory. The new circuit centerline is read from
`../src/rmpc_f1tenth/maps/F1_STYLE/`. The copied slalom and local figures,
JAMRIS class, bibliography style, and fonts are included here. To regenerate
the new local figure from its raw bag while the project container is running,
use `./run.sh plot-f1 run_20261112_115749` from the repository root,
then copy the result to `figures/local_f1_track_response.png` before compiling.
To reproduce the controlled study, follow
`../experiments/README.md`, run
`python3 experiments/summarize_study.py` from that project folder, and copy
the generated PDF plots and LaTeX table from `experiments/report/` into this
directory before compiling. Publication metadata remain draft placeholders.
