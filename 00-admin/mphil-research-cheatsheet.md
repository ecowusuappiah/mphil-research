# mphil-research — Quick Reference

Keep this open next to your terminal. Everything below assumes you're
inside the project folder:

```bash
cd /c/Users/Lenovo/Desktop/shallwe/mphil-research
```

(This is Git Bash's way of writing `C:\Users\Lenovo\Desktop\shallwe\mphil-research`.
If you ever move or rename the folder again, just update this line.)

---

## Starting a new research area

```bash
make new-area NAME=your-area-name
```
Use lowercase words separated by hyphens, e.g. `NAME=bayesian-modelling`.

Then:
1. Open `01-exploration/areas/your-area-name/workflow.tex` in a text
   editor and fill in the TODOs.
2. Run:
   ```bash
   make refresh-index
   ```
3. Open `00-admin/areas-index.md` and add a row for the new area by hand.

---

## Checking your work compiles (do this before every commit)

```bash
make check
```
- `OK: exploration log compiles cleanly` = good, proceed.
- `FAILED -- see /tmp/mphil-check.log` = something's broken; open that
  log file and look for the first line starting with `!`.

## Building the actual PDF to look at

```bash
make explore
```
Opens as `build/exploration-log.pdf`.

---

## Saving your progress to GitHub (do this often)

Three commands, always in this order:

```bash
git add -A
git commit -m "short description of what you changed"
git push
```

**Commit message style** (prefix by what part of the repo changed):
```
explore(area-name): what you did
lit: what you did
admin: what you did
thesis(ch1): what you did
```

Examples:
```bash
git commit -m "explore(garch-frontier): add GSE data access notes"
git commit -m "lit: add bollerslev1986 note and tag it high-relevance"
git commit -m "admin: mark survival-censoring as shortlisted"
```

---

## Checking what's changed before you commit

```bash
git status
```
Shows which files you've edited/added, in plain language.

```bash
git diff
```
Shows the actual line-by-line changes. Press `q` to exit this view.

---

## Marking a real milestone

```bash
git tag -a milestone-name -m "One-line description"
git push --tags
```

Example:
```bash
git tag -a milestone-topic-selected -m "Topic finalised: zero-inflated GLMs for claims"
git push --tags
```

---

## If something feels stuck or broken

```bash
git status
```
almost always tells you what state you're in. Paste the output back to
Claude if you're not sure what to do next — that single command gives
enough context to help.

---

## Things you should NOT do

- Don't hand-edit the block between
  `% AUTO-GENERATED-AREAS-START` and `% AUTO-GENERATED-AREAS-END` in
  `01-exploration/main.tex` — run `make refresh-index` instead.
- Don't delete an area folder just because an idea didn't work out —
  set its status to `Rejected` in `workflow.tex` and note why in
  `00-admin/areas-index.md`. The reasoning is worth keeping.
- Don't commit PDFs or `.aux`/`.log` build files — they're already
  excluded via `.gitignore`, so if `git status` shows them, something's
  off; ask before force-adding them.
