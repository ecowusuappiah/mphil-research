LATEX = pdflatex -interaction=nonstopmode -halt-on-error

.PHONY: explore thesis check clean new-area refresh-index help

help:
	@echo "Targets:"
	@echo "  make explore              - build the exploration log -> build/exploration-log.pdf"
	@echo "  make thesis               - build the thesis (once 06-thesis/main.tex exists)"
	@echo "  make check                - fast compile check, no PDF output kept (good for pre-commit)"
	@echo "  make new-area NAME=foo    - scaffold a new area under 01-exploration/areas/foo"
	@echo "  make refresh-index        - regenerate the area list in 01-exploration/main.tex"
	@echo "  make clean                - remove all LaTeX build artifacts"

explore:
	cd 01-exploration && $(LATEX) main.tex && $(LATEX) main.tex
	mkdir -p build
	mv 01-exploration/main.pdf build/exploration-log.pdf
	@echo "Built build/exploration-log.pdf"

thesis:
	@if [ -f 06-thesis/main.tex ]; then \
		cd 06-thesis && $(LATEX) main.tex; \
		( cd 06-thesis && bibtex main ) || true; \
		cd 06-thesis && $(LATEX) main.tex && $(LATEX) main.tex; \
		mkdir -p build && mv 06-thesis/main.pdf build/thesis.pdf; \
		echo "Built build/thesis.pdf"; \
	else \
		echo "06-thesis/main.tex does not exist yet -- nothing to build."; \
	fi

check:
	cd 01-exploration && $(LATEX) main.tex > /tmp/mphil-check.log 2>&1 \
		&& echo "OK: exploration log compiles cleanly" \
		|| (echo "FAILED -- see /tmp/mphil-check.log" && exit 1)
	@$(MAKE) clean

new-area:
	@scripts/new-area.sh "$(NAME)"

refresh-index:
	@scripts/refresh-index.sh

clean:
	find . -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.toc" \
		-o -name "*.bbl" -o -name "*.blg" -o -name "*.fls" -o -name "*.fdb_latexmk" \
		-o -name "*.synctex.gz" \) -delete
	rm -rf build
