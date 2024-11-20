class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241120105919"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120105919/exc-darwin-arm64.tar.gz"
      sha256 "f75ead7fd97046fa95fba9bd904d56193eca225efde36d73de35ec57b597f122"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120105919/exc-darwin-amd64.tar.gz"
      sha256 "2b60c2220c244d34bc93060a499062f4239fb287a20a858ba65fcc8caa610a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120105919/exc-linux-arm64.tar.gz"
      sha256 "be345b7f593533c9b12146ec14feee94f2f6e00ed9878bba5df125cdddaf962c"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120105919/exc-linux-amd64.tar.gz"
      sha256 "1ef8fc1629f5c183890f127889b5ea263c2e346b020cb3b9ff7f0d93281e762d"
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
