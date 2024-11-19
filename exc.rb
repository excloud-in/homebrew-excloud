class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241119071440"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241119071440/exc-darwin-arm64.tar.gz"
      sha256 "c7a825d72a57825499a6e4eff3c7f6c75c1379b1de45e73267880591ec0f6254"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241119071440/exc-darwin-amd64.tar.gz"
      sha256 "80199abde5464e1d48288bf24c154d57122890694fa708b61c7a0eaf25c99bd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241119071440/exc-linux-arm64.tar.gz"
      sha256 "fa23dc29bf4e762f2510a441799185c89a616cbc8c53207a64afad77f8b2ebf0"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241119071440/exc-linux-amd64.tar.gz"
      sha256 "844eb8b81f90c23acb30a6a99cef4d4c206a1b920f0dc55b926c46808dfd399a"
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
