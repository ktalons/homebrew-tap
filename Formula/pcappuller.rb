class Pcappuller < Formula
  desc "Fast PCAP window selector, merger, and trimmer (CLI single-binary)"
  homepage "https://github.com/ktalons/daPCAPpuller"
  version "0.3.1"
  license "MIT"

  url "https://github.com/ktalons/daPCAPpuller/releases/download/v0.3.1/PCAPpullerGUI-macos.zip"
  sha256 "4b56fb250466f3a71b03dc952fb90fcac45a845690590d660e9b103c9da6bf4c"

  def install
    if OS.linux?
      bin.install "PCAPpullerGUI-linux" => "pcappuller-gui"
    else
      odie "This formula installs only the Linux CLI binary. " \
           "On macOS, use the cask: brew install --cask ktalons/tap/pcappuller"
    end
  end

  test do
    return unless OS.linux?

    system bin/"pcappuller-gui", "--help"
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      On macOS, install the app bundle via cask:
        brew install --cask ktalons/tap/pcappuller
    EOS
  end
end
