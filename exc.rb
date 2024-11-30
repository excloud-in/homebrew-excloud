class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-arm64.tar.gz"
      sha256 "8788eac46a396814a4cf1c2be75e539ea2488368aaf93a20ca849c1578632983"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-darwin-amd64.tar.gz"
      sha256 "04ecc1bf51726ad81fa3eb19d8dc4e3a2085b120114ca2746b1fc927f20caa1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-arm64.tar.gz"
      sha256 "74c117c2c5c91a78379dc3efb49323a75d4c1a0756e2d0dd00e6f93f80a0f719"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.1/exc-linux-amd64.tar.gz"
      sha256 "831e9b9eed13683e30817690c14ddd22f00c5a2e0bf4c5857e5bbb3d103dca3b"
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
