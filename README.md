# DotSimulationBox

A MATLAB simulation of particles bouncing inside a 3D box, with wall and particle-to-particle collisions controlled by a coefficient of restitution.

*Early work: university coursework.*

## Context

Uploaded to GitHub in August 2019. The original date and course are not recorded in the repo.

## What it shows

- A time-stepped simulation of particles with random initial positions and velocities.
- Collision handling against the six walls, with velocity reflection scaled by the restitution coefficient `e`.
- Particle-to-particle collisions that exchange velocities along each axis.
- Two versions. `caja.m` is the first draft. `caja_simulada.m` is the cleaner rewrite, with position and velocity matrices, documented parameters, and an optional plot mode that draws velocity vectors.
- Real-time 3D visualisation with `plot3`.

## Stack

MATLAB.

## Run it

In MATLAB, call `caja_simulada(n, p, os, e)`, where `n` is the number of steps, `p` the number of particles, `os` the plot mode and `e` the restitution coefficient.

## Looking back (2026)

The first draft has a copy-paste slip (the z-velocity is written into the x-component), which shows why I would now vectorise the update step and check energy conservation with a test.
