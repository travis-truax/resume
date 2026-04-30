# Resume

Version-controlled resume workspace.

## Structure

- `source/` - Source Word docs
- `latex/` - Editable LaTeX source
- `output/` - Compiled PDF output

## Build

Compile from repo root:

```bash
/Library/TeX/texbin/xelatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
```

Run twice for stable references/bookmarks:

```bash
/Library/TeX/texbin/xelatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
/Library/TeX/texbin/xelatex -interaction=nonstopmode -output-directory=output latex/Travis_Truax_2026_update.tex
```

Note: The template is configured for `Cambria` when available. If Cambria is not
installed, it falls back to `Times New Roman`.
