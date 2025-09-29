# ktalons/homebrew-tap

[![Update Homebrew Formula](https://github.com/ktalons/homebrew-tap/actions/workflows/update-formula.yml/badge.svg?branch=main)](https://github.com/ktalons/homebrew-tap/actions/workflows/update-formula.yml)

A Homebrew tap for distributing custom formulas. Currently includes:

- pcappuller: Installs the PCAPpuller GUI binary from the upstream project at https://github.com/ktalons/daPCAPpuller

## Install

- Add the tap and install the formula:

```bash
brew tap ktalons/tap
brew install ktalons/tap/pcappuller
```

Notes
- On macOS, you might need to allow the binary in System Settings > Privacy & Security after first run (Gatekeeper).
- The GUI requires Wireshark CLI tools (mergecap, editcap, tshark, capinfos) to be on your PATH.

## Updating the formula

This repo has an automated workflow that updates the formula to the latest upstream release and pushes changes to main.

Triggers
- Manual: Run the “Update Homebrew Formula” workflow from the Actions tab.
- Scheduled: Daily at 06:00 UTC.
- Repository Dispatch: Can be triggered via API from the upstream repo or any caller with repo write access.

Manual run examples
- From the Actions UI: you can optionally specify `tag` and `asset_name`. If left blank, the workflow attempts to auto-detect the latest release and macOS asset.
- From CLI using GitHub CLI:

```bash
# Update to a specific tag
gh workflow run update-formula.yml -f tag=v0.1.0 -f asset_name=PCAPpullerGUI-macos

# Dry run (no commit/push) – useful to preview the diff and validations
gh workflow run update-formula.yml -f dry_run=true
```

repository_dispatch example

```bash
# Put a token with repo write permissions into an environment variable
GH_TOKEN={{GITHUB_TOKEN_WITH_REPO_WRITE}}

curl -sS -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GH_TOKEN}" \
https://api.github.com/repos/ktalons/homebrew-tap/dispatches
  -d '{"event_type":"update-formula"}'
```

## CI details

Workflow: .github/workflows/update-formula.yml
- Detects the latest release tag (or uses an input), finds the macOS asset, computes SHA256, and updates Formula/pcappuller.rb.
- Shows a diff of the changes.
- If not a dry run, commits and pushes to main.
- After pushing, runs a macOS job to execute:
  - `brew style Formula/pcappuller.rb`
  - `brew audit --new --strict Formula/pcappuller.rb` (falls back to `--strict`)

Dry-run mode
- Pass `dry_run=true` via workflow_dispatch to execute all steps except commit/push.
- Validates URL reachability and SHA256, and shows the planned diff.

## Development

- Formula lives at `Formula/pcappuller.rb`.
- If you change naming of upstream assets, update the workflow default `asset_name` or trigger with a specific `asset_name`.
- PRs are welcome if we add more formulas or improve CI.

## Templates

- Formula/example_tool.rb: Template for installing a prebuilt single-binary release (download URL + sha256; uses bin.install).
- Formula/template_go_project.rb: Template for building and installing a Go project from source (uses go build with std_go_args).
