PDF=output/Travis_Truax_2026_update.pdf
TEX=latex/Travis_Truax_2026_update.tex
XELATEX=/Library/TeX/texbin/xelatex

.PHONY: build clean

build:
	$(XELATEX) -interaction=nonstopmode -output-directory=output $(TEX)
	$(XELATEX) -interaction=nonstopmode -output-directory=output $(TEX)

clean:
	rm -f output/*.aux output/*.log output/*.out output/*.toc output/*.synctex.gz output/*.fls output/*.fdb_latexmk
