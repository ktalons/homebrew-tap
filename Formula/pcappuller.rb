class Pcappuller < Formula
  desc "Fast PCAP window selector, merger, and trimmer with GUI"
  homepage "https://github.com/ktalons/daPCAPpuller"
  url "https://github.com/ktalons/daPCAPpuller/releases/download/v0.1.2/PCAPpullerGUI-macos.zip"
  sha256 "33494ebffa5e273f118849c1bf79febc3aaa94b3996de7c7a34425d7b964c544"
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
