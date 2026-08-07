class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-dev/cli"
  version "v1.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.11.0/exc-darwin-arm64.tar.gz"
      sha256 "212eadf3b36e23303b68dc1c1dda4ed38b420357fe8f9190193793739012f9be"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.11.0/exc-darwin-amd64.tar.gz"
      sha256 "bf72fad4979870edfb21ffa1fc07974b8fe2aee3ed23e4ecadf84c1c655de280"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.11.0/exc-linux-arm64.tar.gz"
      sha256 "dde0314370169ec707abacb3f656d08d73720897ca6dc3e06e8ddfc4af30d728"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.11.0/exc-linux-amd64.tar.gz"
      sha256 "4b5a9a8df5212d9b7bbe7e2811abb642f1cce481dfa7736d3ace70c0028aee6f"
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
