---
area: zero-inflated-glm-claims
bibkey: gu2024
gap-relevance: high
verified: 2026-08-23
---

# Gu (2024) — Dispersion Modeling in Zero-Inflated Tweedie Models

## Summary
Extends the zero-inflated Tweedie model by modelling the dispersion
parameter (not just the mean) using gradient-boosted decision trees,
alongside a generalized EM approach for the zero-state probability.
Aimed at semicontinuous claim data (frequency + severity combined via
Tweedie) rather than pure frequency counts.

## Why it matters to this area
Represents the current frontier of the ZIP-family literature as of
2024 — useful as a benchmark for "how sophisticated has this modelling
approach already gotten" before claiming novelty.

## Limitations / gap it leaves open
Built and validated on large, data-rich portfolios (the kind used in
gradient-boosting studies generally). Doesn't address small/thin
exposure bases or data-scarce settings — which is exactly where this
area's gap sits.