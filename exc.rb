class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241120095044"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120095044/exc-darwin-arm64.tar.gz"
      sha256 "949bbbeac02a463b99a0f73338e1a424502f25671e21f818d9cd1c6cdc1ca833"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120095044/exc-darwin-amd64.tar.gz"
      sha256 "2a504cd35d286b9079cda5cdebd1bc5c195a2a4e2800b57a5ab57f90b20b9636"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241120095044/exc-linux-arm64.tar.gz"
      sha256 "af30edd1fd4417ec050650979d9f28a241966bbf1e7aed7738e6f167cc6ee51a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241120095044/exc-linux-amd64.tar.gz"
      sha256 "05327c4041ba33c548d7e0728d47d3ee2000e1a10cd9f525e4577a366542c235"
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
