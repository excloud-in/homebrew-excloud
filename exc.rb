class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.1.0/exc-darwin-arm64.tar.gz"
      sha256 "0d3223da692092ed2af731a8fd86fa135fcee6522e806b95279892992eb07d28"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.1.0/exc-darwin-amd64.tar.gz"
      sha256 "ca632d5ca9062b46a2a7bc76a7383bacabca0426b661f0319a06ce72530465bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.1.0/exc-linux-arm64.tar.gz"
      sha256 "8754ac47043b19ae0febf647438a7693e9acd3b83094090b1624ed4d873cd789"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.1.0/exc-linux-amd64.tar.gz"
      sha256 "09423dcbc005c678df59c62aeb0e76bc7a858fbb711a9b0111edb79486519403"
    end
  end

  def install
    bin.install "exc"
    generate_completions_from_executable(bin/"exc", "completion")
  end

  test do
    assert_predicate bin/"exc", :exist?
    assert_predicate bin/"exc", :executable?
  end
end
