class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.4.0/exc-darwin-arm64.tar.gz"
      sha256 "9f1b3067c0125e9d4e97fbfc57ed1bc3086ec416f4b49a0b994b26c4caca9fe9"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.4.0/exc-darwin-amd64.tar.gz"
      sha256 "b0f348687d7afe74e0a13b49a881eee0015e2d92ca31bfb115ddbfffd41c17df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.4.0/exc-linux-arm64.tar.gz"
      sha256 "02d08ea504737a9175c2ac1d8cd9b4015f7330c740bb4f9819fcd32fb02ef311"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.4.0/exc-linux-amd64.tar.gz"
      sha256 "f1686092bd541e18bb1f9604e3f44001e4c81f7774252cba823e8f0917d52060"
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
