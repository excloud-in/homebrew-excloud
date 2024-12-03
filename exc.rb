class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.2/exc-darwin-arm64.tar.gz"
      sha256 "b7971557b7a8a4339b9f1960863aa6b6aad88d6669f7eea8323b5b6c51f14999"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.2/exc-darwin-amd64.tar.gz"
      sha256 "d88d63c8e2af8c6229e779b09807cb15d04327d1ec7a1ab763a07ce8be5d06fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.2/exc-linux-arm64.tar.gz"
      sha256 "22c0f84d0fde8049f34247576e754bc6899d0305f67f113ca0f13ae9644d1d2b"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.2/exc-linux-amd64.tar.gz"
      sha256 "8cd307435bdbec0989518af2f9da10eed88f7c70b8d325aeb2ee5ba3b9c0e33f"
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
