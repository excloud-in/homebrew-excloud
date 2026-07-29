class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-dev/cli"
  version "v1.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.2/exc-darwin-arm64.tar.gz"
      sha256 "a31809b7016c347a039ac906a8ee1425c95008df2831eddae10d43fbaa4116c3"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.2/exc-darwin-amd64.tar.gz"
      sha256 "a3aecbe2e76817692a7a126d795215196c83d4b677294cc039f54feb8a5d83b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.2/exc-linux-arm64.tar.gz"
      sha256 "1e72e2fd4ea04b49dcf98ac9638a7f0261406d076539d57e93502d6bbbdecbb9"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.2/exc-linux-amd64.tar.gz"
      sha256 "24fb44c1839f19772a4e7d068a7f2066a1422284f236deda1086551806a3d296"
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
