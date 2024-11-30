class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-darwin-arm64.tar.gz"
      sha256 "a0aafc9acfdf2fd86969abc91dddabe7a2a679a87b00770d6dacb1777584d2ed"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-darwin-amd64.tar.gz"
      sha256 "6bc6575c08f06b3ddb6c3c80234263bbf0f06bd6550c78d309ed714a9b274904"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-linux-arm64.tar.gz"
      sha256 "5e639beec342065e93bb9908b27e0513a34ffb444eeb12935a4ba37b4ce4fe57"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.0/exc-linux-amd64.tar.gz"
      sha256 "69ce6e0ac91d67a8f788e61d0cce3003bc904c59a4492bc81551ccdce24cf2b5"
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
