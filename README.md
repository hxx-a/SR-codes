# SR-codes
The Stochastic Resonance (SR) algorithm is a vibration signal feature enhancement technique designed specifically for bearing fault diagnosis scenarios. At its core, it employs nonlinear processing, adaptive parameter optimization, and Hilbert envelope analysis to improve the discernibility of fault characteristic frequencies within noisy bearing fault signals, thereby addressing the challenge of fault features being obscured by noise under low signal-to-noise ratio (SNR) conditions.

This codebase implements four core enhancement algorithms: 2D-Coupled Piecewise SR system, High-Dimensional SR system, Standard Bistable SR system, and Vibration-Resonance-Assisted SR system. Furthermore, it quantitatively evaluates algorithm performance using metrics such as Signal-to-Noise Ratio (SNR) and Signal-to-Noise Ratio Gain (SNRI), making it suitable for the analysis of inner and outer ring fault signals across various bearing datasets.

Ref 149：A Novel High‑Dimensional Coupled FHN Neuron Stochastic Resonance Model and its Performance in Faults Recognition (https://doi.org/10.1007/s42417-024-01693-6)

Ref 208: Application of a vibration resonance-assisted enhanced feedforward cascaded stochastic resonance system in bearing diagnostics (https://doi.org/10.1016/j.chaos.2024.115553)

Ref 209: Adaptive detection of impact signals with two-dimensional piecewise tri-stable stochastic resonance and its application in bearing fault diagnosis (https://doi.org/10.1016/j.apacoust.2023.109702)

A novel piecewise unsaturated asymmetric coupled tri-stable stochastic resonance method: A novel piecewise unsaturated asymmetric coupled tri-stable stochastic resonance method and its application in enhanced detection (https://doi.org/10.1016/j.cjph.2025.04.030)

The core concept underlying this code is based on research conducted between 2023 and 2025. The parameter optimization process is carried out using either a quantum genetic algorithm or a quantum particle swarm optimization algorithm. Notably, parameter tuning significantly influences the optimal system output. The effectiveness of the proposed algorithm has been validated through experiments.
