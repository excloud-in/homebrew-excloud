class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.6.0/exc-darwin-arm64.tar.gz"
      sha256 "86754154ed3af2c1b1910a7da9e7e1356e05eb4ca58f661e98c8ecc1288257a6"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.6.0/exc-darwin-amd64.tar.gz"
      sha256 "bc1ebaf45c7017c450b1f4af848e45fd8048e656237d6ba722d06823bdb6df0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.6.0/exc-linux-arm64.tar.gz"
      sha256 "0d46464ffa39accc9a5891efb661529d25d7ab3c994ff3319457516ded0740fa"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.6.0/exc-linux-amd64.tar.gz"
      sha256 "b7bdfb261724b83050942364d161f1efeba4f44d6ae1f7852eb30c7b8c0c3861"
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
