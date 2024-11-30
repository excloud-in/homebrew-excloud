class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-arm64.tar.gz"
      sha256 "e3da50806bba2a86fa996386e9f364bddc535efddc51a635405a788d0963b52a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-amd64.tar.gz"
      sha256 "061864547f0982e4e9871c0530239c0dd5acaf0e23fc64554cb4343e7c9f498d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-arm64.tar.gz"
      sha256 "5738429da9288dd0b7878c3ea3758b34ba36fd081526af899687bfffd2b31a55"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-amd64.tar.gz"
      sha256 "b2a537e3a58a9b254cd760a0684b2bd7edd6a53b0d00cd4880a3b64c849fc85a"
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
