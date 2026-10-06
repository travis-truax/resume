XELATEX=/Library/TeX/texbin/xelatex

.PHONY: all software trucking cover release clean

all: software trucking

define build_resume
	$(XELATEX) -interaction=nonstopmode -output-directory=output -jobname=$(1) $(2)
	$(XELATEX) -interaction=nonstopmode -output-directory=output -jobname=$(1) $(2)
endef

software:
	$(call build_resume,TravisTruax_Software,latex/TravisTruax_Software.tex)

trucking:
	$(call build_resume,TravisTruax_Trucking,latex/TravisTruax_Trucking.tex)

cover:
	$(call build_resume,TravisTruax_Trucking_Cover,latex/TravisTruax_Trucking_Cover.tex)

release:
	@if [ -z "$(VERSION)" ] || [ -z "$(MSG)" ]; then \
		echo 'Usage: make release VERSION=software|trucking MSG="short summary of changes"'; \
		exit 1; \
	fi
	@case "$(VERSION)" in \
		software|trucking) ;; \
		*) echo 'VERSION must be software or trucking'; exit 1 ;; \
	esac
	$(MAKE) $(VERSION)
	@if [ "$(VERSION)" = "software" ]; then \
		cp output/TravisTruax_Software.pdf TravisTruax_Software.pdf; \
		git add latex/style.tex latex/TravisTruax_Software.tex output/TravisTruax_Software.pdf; \
	else \
		$(MAKE) cover; \
		cp output/TravisTruax_Trucking.pdf TravisTruax_Trucking.pdf; \
		cp output/TravisTruax_Trucking_Cover.pdf TravisTruax_Trucking_Cover.pdf; \
		git add latex/style.tex latex/TravisTruax_Trucking.tex latex/TravisTruax_Trucking_Cover.tex output/TravisTruax_Trucking.pdf output/TravisTruax_Trucking_Cover.pdf; \
	fi
	git commit -m "$$(date +%Y-%m-%d) resume release: $(MSG)"
	git push

clean:
	rm -f output/*.aux output/*.log output/*.out output/*.toc output/*.synctex.gz output/*.fls output/*.fdb_latexmk
