class Pcappuller < Formula
  include Language::Python::Virtualenv

  desc "Fast PCAP window selector, merger, trimmer, and cleaner (CLI)"
  homepage "https://github.com/ktalons/PCAPpuller"
  url "https://github.com/ktalons/PCAPpuller/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "fd01f0dc32b8777820fbcbf708b4b019e1a560a9490025bdb5ed3c5440ddaa0d"
  license "MIT"
  head "https://github.com/ktalons/PCAPpuller.git", branch: "main"

  depends_on "python@3.13"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/21/3b/6c24bec5be5e743ffd99576daa5cc077722fc7d5bbc00bd133fa0c698dc6/tqdm-4.70.0.tar.gz"
    sha256 "55b0b0dbd97462d06ebee91e4dac24ed4d4702be82b24f07e6c1d27e08cea220"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      PCAPpuller shells out to the Wireshark CLI tools (mergecap, editcap,
      capinfos, tshark). Install them with:
        brew install wireshark

      For the macOS GUI app, use the cask instead:
        brew install --cask ktalons/tap/pcappuller
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pcap-puller --version")
  end
end
