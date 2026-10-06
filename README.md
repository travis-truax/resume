# Resume

Version-controlled resume workspace. The software and trucking resumes are separate documents that share one layout.

## Structure

- `source/` - Source Word docs
- `latex/style.tex` - Shared layout
- `latex/TravisTruax_Software.tex` - Software engineer resume
- `latex/TravisTruax_Trucking.tex` - Trucking resume
- `latex/TravisTruax_Trucking_Cover.tex` - Trucking cover letter
- `output/` - Compiled PDF output

## Build

Compile from repo root:

```bash
make              # both versions
make software     # output/TravisTruax_Software.pdf
make trucking     # output/TravisTruax_Trucking.pdf
make cover        # output/TravisTruax_Trucking_Cover.pdf
```

Note: The template is configured for `Cambria` when available. If Cambria is not
installed, it falls back to `Times New Roman`.

## Release

Rebuild one version, then commit and push that version only:

```bash
make release VERSION=software MSG="short summary of changes"
make release VERSION=trucking MSG="short summary of changes"
```

This will:

- rebuild the chosen resume
- for the trucking version, also rebuild the cover letter
- copy the PDF to a matching file at the repo root (local send-copy; root PDFs stay gitignored)
- commit that version's source, the shared style, and its PDF in `output/`
- push to remote
