# Examples (Template Formulae)

This directory contains example (template) Homebrew formulae. They are not intended to be audited, tapped, or installed as-is.

Why they’re here
- To provide starting points for new formulae without breaking tap-level audits.
- Files are intentionally outside `Formula/` so `brew audit --tap` ignores them.

How to use these templates
1) Copy a template into `Formula/` and rename the file to match your formula class name.
2) Update required fields:
   - `desc` should not start with the formula name.
   - `homepage` must be a reachable URL.
   - `url` should match the version you intend to release; remove explicit `version` if it’s inferable from the URL.
   - `sha256` must match the archive.
   - `license`, `depends_on`, `install`, and `test` should be customized to your project.
   - Prefer `bin/"tool"` over string interpolation like `"#{bin}/tool"`.
3) Validate locally:
   - `brew style Formula/<your_formula>.rb`
   - `brew audit --strict --online <your_formula>`

Notes
- Keeping templates here avoids failing CI on placeholder URLs or unreachable homepages.
- When your formula is ready, only files under `Formula/` will be considered by tap audits.
