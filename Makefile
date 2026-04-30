PDF=output/Travis_Truax_2026_update.pdf
TEX=latex/Travis_Truax_2026_update.tex
PDFLATEX=/Library/TeX/texbin/pdflatex

.PHONY: build clean

build:
	$(PDFLATEX) -interaction=nonstopmode -output-directory=output $(TEX)
	$(PDFLATEX) -interaction=nonstopmode -output-directory=output $(TEX)

clean:
	rm -f output/*.aux output/*.log output/*.out output/*.toc output/*.synctex.gz output/*.fls output/*.fdb_latexmk
