cask "pcappuller" do
  version "0.4.0"
  sha256 "d98c1ab0e16a6b3c7492275f96750454902a2751d64799079799aaaf284826da"

  url "https://github.com/ktalons/PCAPpuller/releases/download/v#{version}/PCAPpullerGUI-macos.zip",
      verified: "github.com/ktalons/PCAPpuller/"
  name "PCAPpuller"
  desc "Fast PCAP window selector, merger, trimmer, and cleaner (GUI)"
  homepage "https://github.com/ktalons/PCAPpuller"

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
