class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-dev/cli"
  version "v1.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.10.0/exc-darwin-arm64.tar.gz"
      sha256 "68c75abece5c575124b682dfd1deb40cfa5776bbd5828321c103ae483a7eb11b"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.10.0/exc-darwin-amd64.tar.gz"
      sha256 "d7c653a7f4bee5798367fa7ba66c15debe898780c3d764299cd544653a6c1fe5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.10.0/exc-linux-arm64.tar.gz"
      sha256 "65b6efdfa3677dfa44308b915ff91d0c2485bdcb296ddc7d4d2c072fd5959fd6"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.10.0/exc-linux-amd64.tar.gz"
      sha256 "155a0cf89b290583a8e0dee9b541606d5707f1f0cd4bbc392b22acbac65e93cf"
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
