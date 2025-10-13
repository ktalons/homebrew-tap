class Pcappuller < Formula
  desc "Fast PCAP window selector, merger, and trimmer (CLI single-binary)"
  homepage "https://github.com/ktalons/daPCAPpuller"
  version "0.3.1"
  url "https://github.com/ktalons/daPCAPpuller/releases/download/v0.3.1/PCAPpullerGUI-linux"
  license "MIT"

  sha256 "0b2bd1715756ee61e823ba9ff3e907f2304c8991f7cceff90ea42e51ed5126c7"

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
