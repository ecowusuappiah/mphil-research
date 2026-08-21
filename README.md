# MPhil Research — Mathematical Statistics (KNUST)

Edward Collin Owusu-Appiah's research repo. One place for exploration,
literature, code, data, papers, thesis, and presentations — structured
so nothing has to live only in your memory.

## Start here

**`00-admin/areas-index.md`** is the dashboard — every research area
you've looked at, one row each, with status and links. Check it first.

## Layout

```
00-admin/           Dashboard, supervisor log, milestones
01-exploration/      Structured notes per candidate research area
  main.tex             master index (auto-lists areas/, don't hand-edit
                        the AUTO-GENERATED block)
  preamble.sty          shared LaTeX setup, used across the whole repo
  _template/            copy this to start a new area (or run
                        `make new-area NAME=...`)
  areas/<name>/          one folder per area explored
02-literature/       Bibliography and reading notes (shared across areas)
  references.bib        single shared .bib file
  notes/                 flat notes, tagged by area in YAML front-matter
  pdfs/                  saved paper PDFs
03-code/            Research code (per-area subfolders, once code exists)
04-data/             Datasets (raw/ is gitignored -- see .gitignore)
05-papers/           Draft papers for publication
06-thesis/           The thesis itself
07-presentations/    Slides, posters, talks
```

## Day-to-day workflow

1. **Exploring a new area:** `make new-area NAME=kebab-case-name`, fill
   in `workflow.tex`, run `make refresh-index`, add a row to
   `00-admin/areas-index.md`.
2. **Reading a paper:** add the citation to `02-literature/references.bib`,
   add a note in `02-literature/notes/` (tag it with the area it belongs
   to in the front-matter), link it from the area's `workflow.tex`.
3. **Building:** `make explore` compiles the exploration log to
   `build/exploration-log.pdf`. `make thesis` does the same for the
   thesis once `06-thesis/main.tex` exists.
4. **Before committing:** `make check` does a fast compile check so a
   broken `.tex` file never lands in the repo.

## Git conventions

Single `main` branch — this is solo research, branches add ceremony
without benefit here. Commit messages are prefixed by area of the repo:

```
explore(garch-frontier): add volatility clustering notes
lit: tag gu2024 as key gap paper
admin: update areas-index status for zero-inflated-glm
thesis(ch2): draft literature review intro
```

Tag real milestones so they're easy to find later:

```
git tag -a milestone-topic-selected -m "Topic finalised: <name>"
```

See `00-admin/milestones.md` for the full checklist.
