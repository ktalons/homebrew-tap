class Pcappuller < Formula
  desc "Fast PCAP window selector, merger, and trimmer (CLI single-binary)"
  homepage "https://github.com/ktalons/daPCAPpuller"
  license "MIT"
  version "0.3.1"

  on_linux do
    url "https://github.com/ktalons/daPCAPpuller/releases/download/v#{version}/PCAPpullerGUI-linux"
    sha256 "0b2bd1715756ee61e823ba9ff3e907f2304c8991f7cceff90ea42e51ed5126c7"

    def install
      bin.install "PCAPpullerGUI-linux" => "pcappuller-gui"
    end

    test do
      system bin/"pcappuller-gui", "--help"
    end
  end

  on_macos do
    def install
      odie "This formula installs only the Linux CLI binary. On macOS, use the cask: brew install --cask ktalons/tap/pcappuller"
    end

    def caveats
      <<~EOS
        On macOS, install the app bundle via cask:
          brew install --cask ktalons/tap/pcappuller
      EOS
    end
  end
end
