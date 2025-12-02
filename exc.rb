class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.4/exc-darwin-arm64.tar.gz"
      sha256 "56ebd86c0855824c8c36d24afe4a09ee0303db74e94496ccf25cdf29f0654458"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.4/exc-darwin-amd64.tar.gz"
      sha256 "387f905af71e883ed270a1b7253c6e44e8bb1053a952b03881375509b295745e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.4/exc-linux-arm64.tar.gz"
      sha256 "aaf8e7293b239319011a835f2c95ae5fcf337e1ea773001dfa6e3d20aa90c52d"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.4/exc-linux-amd64.tar.gz"
      sha256 "9a83f020048e78820e5cb527fc3e5b90198fa792a3ff6c0aecef340f9bdc079e"
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
