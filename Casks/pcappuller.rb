cask "pcappuller" do
  version "0.3.1"
  sha256 "4b56fb250466f3a71b03dc952fb90fcac45a845690590d660e9b103c9da6bf4c"

  url "https://github.com/ktalons/daPCAPpuller/releases/download/v#{version}/PCAPpullerGUI-macos.zip",
      verified: "github.com/ktalons/daPCAPpuller/"
  name "PCAPpuller"
  desc "Fast PCAP window selector, merger, trimmer, and cleaner (GUI)"
  homepage "https://github.com/ktalons/daPCAPpuller"

  # App built with PyInstaller, compatible with recent macOS; adjust if you need older
  depends_on macos: ">= :catalina"

  app "PCAPpullerGUI.app"

  zap trash: [
    "~/Library/Application Support/pcappuller",
    "~/Library/Caches/pcappuller",
    "~/Library/Preferences/com.ktalons.PCAPpuller.plist",
  ]

  caveats <<~EOS
    Requires Wireshark CLI tools (mergecap, editcap, tshark, capinfos) on PATH.
    Install via Homebrew with:
      brew install wireshark
    Then re-run PCAPpuller if CLI tools were missing.
  EOS
end
