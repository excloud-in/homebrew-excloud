class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.8.0/exc-darwin-arm64.tar.gz"
      sha256 "1d90418927eeae32fb87316254f2a480f8eb04af70878591c46a43fbf52823a5"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.8.0/exc-darwin-amd64.tar.gz"
      sha256 "3b94422f0fa4a7c26bd86d51ac0eee63280188a0ae5689bac995295111f849b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.8.0/exc-linux-arm64.tar.gz"
      sha256 "4ac4a05d77c75d4acaa1807015a996f970764f689389ba126f6c13e8827d3915"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.8.0/exc-linux-amd64.tar.gz"
      sha256 "c946b70b05a87a0e158679c4682dce9a336c963ba5e7788d06b2093ff36a4070"
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
