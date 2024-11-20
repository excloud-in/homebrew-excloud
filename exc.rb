class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241120084430"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120084430/exc-darwin-arm64.tar.gz"
      sha256 "5cfa322f936e8fe2e90d691e03b3a54b232fc4b3d524f481a30a306ce9e7dcac"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120084430/exc-darwin-amd64.tar.gz"
      sha256 "5914f9d8c76ff328ea26c62f11b568b34c486835a94d7121c233073d2e8922be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120084430/exc-linux-arm64.tar.gz"
      sha256 "689ddbde28566381fc3542de855496938ea3f557f94419c8db812725039b589a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120084430/exc-linux-amd64.tar.gz"
      sha256 "619f3df8cc791b984103c4d76c5af46a45beb61ae8bb5e5ae5294c14abdcf18a"
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
