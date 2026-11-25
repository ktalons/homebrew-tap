# ktalons/homebrew-tap

Homebrew tap for [PCAPpuller](https://github.com/ktalons/PCAPpuller).

| What | Command | Installs |
|------|---------|----------|
| Formula | `brew install ktalons/tap/pcappuller` | `pcap-puller` and `pcap-clean` CLIs, built from source |
| Cask (macOS) | `brew install --cask ktalons/tap/pcappuller` | PCAPpullerGUI.app from the latest release |

Both need the Wireshark CLI tools on PATH (`brew install wireshark`). Gatekeeper
may require allowing the app under System Settings > Privacy & Security on
first launch.

## Updating

On a new PCAPpuller release, run the **Update Formula** and **Update Cask**
workflows from the Actions tab with the release tag (e.g. `v0.4.0`). Each
recomputes the sha256 from the published artifact and commits the bump.
