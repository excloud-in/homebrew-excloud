class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-darwin-arm64.tar.gz"
      sha256 "4e10b576e81ff6ac792101ebef224f4725df22c5fa8ddad95622030099c2072e"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-darwin-amd64.tar.gz"
      sha256 "f1317815304519e85a4a1e3fc46f4a8a2a769d4e2d02dc030682c73a37aa7629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-linux-arm64.tar.gz"
      sha256 "ce8e8c7ce236c55c8c68f1248af9d834e89a041e5d62051974a1c301681f9563"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-linux-amd64.tar.gz"
      sha256 "1c8fb4a2ef05dccaccad195d80d9b9ed689b0926426c89d75a35ff330a3d3f19"
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
