class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-arm64.tar.gz"
      sha256 "9c6c1d33a6a2edddcffaa29d580ea435c0b1b09aab61c29a3fdfa3c601a496d5"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-amd64.tar.gz"
      sha256 "2375578d59daef3e112d2deb5c368841d60539f6687a1cd94c9f6385c75ff19b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-arm64.tar.gz"
      sha256 "e4b7b0c5f1a0a80766193b845147f74ac8ded5b91258ba259ba649e6bb8ea863"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-amd64.tar.gz"
      sha256 "d658bcc9388a4ddb85ce1715ba6c17def73e332121c28205ea810011a1abf8db"
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
