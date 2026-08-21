# Areas Index — THE Dashboard

Every area ever looked at, one row each. This is the single source of
truth for where things stand. Update it whenever an area's status
changes — don't let `01-exploration/main.tex` and this file drift apart;
whatever status you set here should match `\areastatus{}` in the area's
`workflow.tex`.

**Status legend:** `Explore` → `Compare` → `Shortlisted` → `Selected` /
`Rejected` (rejected ideas move to a note here but the full reasoning
stays in the area folder — don't delete it).

| Area | Status | Novelty | Feasibility | Workflow | Literature |
|---|---|---|---|---|---|
| GARCH-family volatility in frontier markets | Compare | High | TBD | [workflow](../01-exploration/areas/garch-frontier-markets/workflow.tex) | [notes](../02-literature/notes/) |
| Survival analysis under non-standard censoring | Compare | Very High | TBD | [workflow](../01-exploration/areas/survival-censoring/workflow.tex) | [notes](../02-literature/notes/) |
| Zero-inflated GLMs for insurance claims | Explore | High | TBD | [workflow](../01-exploration/areas/zero-inflated-glm-claims/workflow.tex) | [notes](../02-literature/notes/gu2024-zero-inflated-tweedie.md) |

## Not yet opened as areas (from the initial landscape scan)

These scored well in the initial scan but don't have a folder yet. Run
`make new-area NAME=<kebab-case-name>` to open one.

- Causal inference (intervention / exposure effects)
- Bayesian statistical modelling
- High-dimensional statistics
- Small area estimation
- Spatial / spatio-temporal statistics
- Functional data analysis

## Rejected

_(none yet — when an idea is dropped, keep its area folder, set its
status to `Rejected` in `workflow.tex`, and add a one-line reason here.)_
