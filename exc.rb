class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.4.1/exc-darwin-arm64.tar.gz"
      sha256 "a8cc8f77ab83bde8d6da385f13a3195f36173965f4084c22da8dabbdbd1e2e3c"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.4.1/exc-darwin-amd64.tar.gz"
      sha256 "772f54111832a5cba8305a73f61f7194b7dd6f6fc570367004c57a2eb712c1b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.4.1/exc-linux-arm64.tar.gz"
      sha256 "ce275b6cfe62e2b2d81e39c4439edf05a03bbe6ebd2ed68e1e99a03af9db27c4"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.4.1/exc-linux-amd64.tar.gz"
      sha256 "4eda6cd553df25364fa519f5d1dac8423e3df82aded217ca34ea34ea91e40ad3"
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
