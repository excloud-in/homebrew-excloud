class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241119070053"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241119070053/exc-darwin-arm64.tar.gz"
      sha256 "c78e21a06c49ba428d9fcfdb2ad312ec78524e65a9b8d1e20e3c77fc095eb57a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241119070053/exc-darwin-amd64.tar.gz"
      sha256 "c78e21a06c49ba428d9fcfdb2ad312ec78524e65a9b8d1e20e3c77fc095eb57a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241119070053/exc-linux-arm64.tar.gz"
      sha256 "c78e21a06c49ba428d9fcfdb2ad312ec78524e65a9b8d1e20e3c77fc095eb57a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241119070053/exc-linux-amd64.tar.gz"
      sha256 "c78e21a06c49ba428d9fcfdb2ad312ec78524e65a9b8d1e20e3c77fc095eb57a"
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
