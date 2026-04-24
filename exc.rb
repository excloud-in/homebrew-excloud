class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.6/exc-darwin-arm64.tar.gz"
      sha256 "7fa426f98fd451bd4c7b0337b96009d61a12f95933fd218cd968cd48d42c9e97"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.6/exc-darwin-amd64.tar.gz"
      sha256 "7f33686a2f67460bacb8e0ee6e859709971c21179a3ff17caac0b554c653bd6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.6/exc-linux-arm64.tar.gz"
      sha256 "c8286b4cdb238f28e77f778064e45ab08cca2f8aeafed9c3dd20aefe39b68197"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.6/exc-linux-amd64.tar.gz"
      sha256 "578f2a0cfd335578b956fb14eb9ce15c613610427cdbb20a30335c4b04b4baae"
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
