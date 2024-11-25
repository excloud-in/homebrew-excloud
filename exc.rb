class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241125103438"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241125103438/exc-darwin-arm64.tar.gz"
      sha256 "8a4bb57126ee8f9b8e1568d2c35f9e30aca6aef0f9a1c6005a1b54fcae935a78"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241125103438/exc-darwin-amd64.tar.gz"
      sha256 "fce9c1999c22908f5313e8912fc1a73709313966c29c59ef2b0ce58d6e5a255e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241125103438/exc-linux-arm64.tar.gz"
      sha256 "72735d71cda3d9ec8850640a08869dc3b127228bdf8ce84676464a41aae65ef2"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241125103438/exc-linux-amd64.tar.gz"
      sha256 "fb3c7e695cb178a0c37b75fcce421b77b5961339f11f6fe54682775a81123f2b"
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
