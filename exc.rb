class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "20241115053144"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-darwin-arm64.tar.gz"
      sha256 "c8685fd95fb6496688a8e73dc29ad0129d886acebc4c12aa09ab681effcf2d26"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-darwin-amd64.tar.gz"
      sha256 "6258dbab7c51ad507049548d9e7123143235c07d55326e62e2d14610d5785dc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-linux-arm64.tar.gz"
      sha256 "68f12a7e6b7805951929360ad7a02a75b9ce155bf0f0fec369c9cd7de6de9933"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-linux-amd64.tar.gz"
      sha256 "a0bb69c4546434285ad4ee9ce5f19845cff6516507fbd45b4db7061998709d31"
    end
  end

  def install
    bin.install "exc"
  end

  test do
    output = shell_output("#{bin}/exc --help", 2)
    assert_match "exc CLI", output
  end
end
