class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.3/exc-darwin-arm64.tar.gz"
      sha256 "00a8cda5a297070239b7b357d4732d9544493e81e39f6f3f7b2c27d1f6bb47e1"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.3/exc-darwin-amd64.tar.gz"
      sha256 "1547445917adcc8ac64aaa08995a8af3fdfd0b6c9a697a151fec94fcc56ffe74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.3/exc-linux-arm64.tar.gz"
      sha256 "fee95002ca786293c6512bc8333e39d03700100813c41b6bd05cf66b5c81d303"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.3/exc-linux-amd64.tar.gz"
      sha256 "46a02e40ce9612af69606e5f969bf3342fd5c42b80ec9fe52cf96c3489c1d729"
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
