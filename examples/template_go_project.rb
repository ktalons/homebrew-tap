class TemplateGoProject < Formula
  desc "TODO: Short, one-line description of the Go project"
  homepage "https://github.com/OWNER/REPO"
  version "0.1.0"
  license "MIT"

  # Build-from-source template for a Go project tagged with v0.1.0
  # Replace OWNER/REPO, tag, and sha256 with real values
  url "https://github.com/OWNER/REPO/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  depends_on "go" => :build

  def install
    # Typical Go build; adjust module path and main package as needed.
    # std_go_args installs to bin and sets proper flags/paths automatically.
    # Example main package path: ./cmd/example
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/example"
  end

  def caveats
    <<~EOS
      Replace OWNER/REPO, the tag, sha256, and main package path (./cmd/example).
      If you want to embed version at build time, extend ldflags:
        -X main.version=#{version}
    EOS
  end

  test do
    # Replace with a meaningful test for your binary
    # For example:
    # output = shell_output("#{bin}/example --version")
    # assert_match version.to_s, output

    system "true"
  end
end
