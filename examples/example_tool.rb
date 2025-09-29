class ExampleTool < Formula
  desc "TODO: Short, one-line description of the tool"
  homepage "https://example.com/project"
  version "0.1.0"
  # For single-binary releases, you can point directly to the macOS asset.
  # Replace the URL and sha256 below with real values from your release.
  url "https://example.com/downloads/example-tool-0.1.0-macos-universal.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # Optional: declare dependencies the tool requires at runtime.
  # depends_on "openssl@3"

  # If your release asset is a tarball/zip containing binaries:
  def install
    # Examples:
    # 1) Single binary inside archive
    # bin.install "example-tool"

    # 2) If you need to rename the installed binary
    # bin.install "example-tool" => "example"

    # 3) If your asset is a raw binary (not archived), just install it directly:
    # bin.install "example-tool-macos" => "example-tool"
  end

  def caveats
    <<~EOS
      Notes:
      - Replace URL and sha256 with your actual release values.
      - If the app is quarantined by macOS Gatekeeper, you may need to allow it in
        System Settings > Privacy & Security.
    EOS
  end

  test do
    # Replace with a meaningful test when you implement the formula.
    # A common pattern is to run the binary with --version or --help.
    # system "#{bin}/example-tool", "--version"

    # As a minimal placeholder for the template, assert true.
    system "true"
  end
end
