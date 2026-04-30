# Resume

Version-controlled resume workspace.

## Structure

- `source/` - Source Word docs
- `latex/` - Editable LaTeX source
- `output/` - Compiled PDF output

## Build

Compile from repo root:

```bash
make build
```

This creates:

- `output/Travis_Truax_2026_update.pdf` (engine output)
- `output/TravisTruax_draft.pdf` (working draft)

Note: The template is configured for `Cambria` when available. If Cambria is not
installed, it falls back to `Times New Roman`.

## Release

Create a release PDF, then commit and push in one step:

```bash
make release MSG="short summary of changes"
```

This will:

- rebuild the resume
- update `output/TravisTruax_draft.pdf`
- remove legacy `output/TravisTruax.pdf` if present
- copy draft to `TravisTruax.pdf` at repo root (release file)
- create a git commit with date + your summary
- push to remote
