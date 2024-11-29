class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241129084603"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241129084603/exc-darwin-arm64.tar.gz"
      sha256 "0f54c7fc95348697b8548b9210aa36b5cbfc497e3102c1b1017419f1815747ed"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241129084603/exc-darwin-amd64.tar.gz"
      sha256 "b3fff24922f1c75ad8966a95337a889b699ea3f4b1a3645e58f345b50fe5d68a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241129084603/exc-linux-arm64.tar.gz"
      sha256 "d3c9e88c9a5b35611c67583313a45199806c66a501924d6d66fd1a73c563af12"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241129084603/exc-linux-amd64.tar.gz"
      sha256 "3ef9252c23055aa2f3f97114200dd41df4e129ba4d1d1e11a8b1f2214c922369"
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
