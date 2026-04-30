# Resume

Version-controlled resume workspace.

## Structure

- `source/` - Source Word docs
- `latex/` - Editable LaTeX source
- `output/` - Compiled PDF output

## Build

Compile from repo root:

```bash
/Library/TeX/texbin/pdflatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
```

Run twice for stable references/bookmarks:

```bash
/Library/TeX/texbin/pdflatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
/Library/TeX/texbin/pdflatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
```
