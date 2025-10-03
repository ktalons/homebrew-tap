class Pcappuller < Formula
  desc "Fast PCAP window selector, merger, and trimmer with GUI"
  homepage "https://github.com/ktalons/daPCAPpuller"
  url "https://github.com/ktalons/daPCAPpuller/releases/download/v0.2.0/PCAPpullerGUI-macos.zip"
  sha256 "1f310babf22c4de54b218f95645d53d6b63a855b458726c63aef570acd86611e"
  license "MIT"

  def install
    bin.install "PCAPpullerGUI-macos" => "pcappuller-gui"
  end

  def caveats
    <<~EOS
      This formula installs the PCAPpuller GUI binary.
      It requires Wireshark CLI tools (mergecap, editcap, tshark, capinfos) on PATH.

      On macOS, you may need to allow the app in System Settings > Privacy & Security (Gatekeeper).
    EOS
  end

  test do
    system bin/"pcappuller-gui", "--help"
  end
end
