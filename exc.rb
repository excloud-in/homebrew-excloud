class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.3.0/exc-darwin-arm64.tar.gz"
      sha256 "4c1aa201ab3f2c05cb0cc6c0aaa47e9c2da808b3e4e7c1398bc320ae997c1dd1"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.3.0/exc-darwin-amd64.tar.gz"
      sha256 "f8ee0398345f53042c2e5eb55c64cc586d4132f154437ccf20c4c3167d547790"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.3.0/exc-linux-arm64.tar.gz"
      sha256 "213ba59fbc954a8301096e57fcd5940fdba9a3e3b15d39e055e567989211837c"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.3.0/exc-linux-amd64.tar.gz"
      sha256 "8458842a49ba6ea01a02d9ea21c9170aa1a0788c2e5f70ae3fa434433625e35b"
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
