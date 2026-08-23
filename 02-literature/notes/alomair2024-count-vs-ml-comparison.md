---
area: zero-inflated-glm-claims
bibkey: alomair2024
gap-relevance: medium
verified: 2026-08-23
---

# Alomair (2024) — Count Regression vs. ML for Zero-Inflated Claims

## Summary
Direct comparative evaluation of Poisson, NB, ZIP, hurdle Poisson,
ZINB, hurdle NB, random forest, SVM, and ANN on a single automobile
insurance claims dataset, evaluated by mean absolute error. SVM comes
out ahead overall, with ZIP/ZINB as the strongest non-ML performers.

## Why it matters to this area
Useful benchmark paper for what "state of the art comparison
methodology" looks like right now — a template for how a
methods-comparison chapter could be structured.

## Limitations / gap it leaves open
Single dataset, not stated to be small/thin-exposure. Doesn't test
sensitivity to sample size or zero-proportion severity, which is the
open question for this area.