class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241123140805"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241123140805/exc-darwin-arm64.tar.gz"
      sha256 "ff4dda96b247e385eabc2a7098641f9333c1237262722b80fa080dc4662f8e09"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241123140805/exc-darwin-amd64.tar.gz"
      sha256 "d0889c359b75e00ecc54ae357aa809c786e7c6e3257c445cc4bf6d4a09fd2139"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241123140805/exc-linux-arm64.tar.gz"
      sha256 "ebb21115d5695d6ea629eb042d07324616b618239df616f67d5d373d4f6464f9"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241123140805/exc-linux-amd64.tar.gz"
      sha256 "0c52e0b5d709c69582563799d2c754b30300407853e437214f4ea71f7652ac12"
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
