class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "20241115053144"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-darwin-arm64.tar.gz"
      sha256 "872de2a35c8869e338bf8d902980fd423b42e8a22319f96eca69eecc7e33f966"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-darwin-amd64.tar.gz"
      sha256 "279d8dfa4e3dce32388f168cb548ab45abc5184ed2179130e3aeb7f5fdabdcef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-linux-arm64.tar.gz"
      sha256 "d0143600f8933471793465f4e16720a8238736a430b7a7747fa00b8c06728172"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241115053144/exc-linux-amd64.tar.gz"
      sha256 "5ed1425d3c334887b89a59aa38066380b18289e9bfa5331d50bbd7f3228f476b"
    end
  end

  def install
    bin.install "exc"
    generate_completions_from_executable(bin/"exc", "completion")
  end

  test do
    output = shell_output("#{bin}/exc --help", 2)
    assert_match "exc CLI", output
  end
end
