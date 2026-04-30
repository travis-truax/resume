TEX=latex/Travis_Truax_2026_update.tex
XELATEX=/Library/TeX/texbin/xelatex
BASE_PDF=output/Travis_Truax_2026_update.pdf
DRAFT_PDF=output/TravisTruax_draft.pdf
RELEASE_PDF=output/TravisTruax.pdf

.PHONY: build draft release clean

build:
	$(XELATEX) -interaction=nonstopmode -output-directory=output $(TEX)
	$(XELATEX) -interaction=nonstopmode -output-directory=output $(TEX)
	cp $(BASE_PDF) $(DRAFT_PDF)

draft: build

release: build
	cp $(DRAFT_PDF) $(RELEASE_PDF)
	@if [ -z "$(MSG)" ]; then echo 'Usage: make release MSG="short summary of changes"'; exit 1; fi
	git add -A
	git commit -m "$$(date +%Y-%m-%d) resume release: $(MSG)"
	git push

clean:
	rm -f output/*.aux output/*.log output/*.out output/*.toc output/*.synctex.gz output/*.fls output/*.fdb_latexmk
