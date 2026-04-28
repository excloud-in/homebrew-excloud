class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.1.1/exc-darwin-arm64.tar.gz"
      sha256 "645db7aa033b7363fe248152c595ed0f8f308eeb4abad038bd9f694ddbc38dd4"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.1.1/exc-darwin-amd64.tar.gz"
      sha256 "b35ccfd665251c4478aaecf8934460431a313c7f6578c676ac7ceeb98d0cfb32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.1.1/exc-linux-arm64.tar.gz"
      sha256 "cb6243f6c30232fee20d30c822b58c77f892352b89c4079c14816c23f3ad69eb"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.1.1/exc-linux-amd64.tar.gz"
      sha256 "2d3197f3f62d81762bcc1ade54e0636e6e315d4d7f79667ff9e68952d22c22bd"
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
