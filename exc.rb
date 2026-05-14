class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.5.0/exc-darwin-arm64.tar.gz"
      sha256 "69aea1c1141102ccb925c907092ac706e16a0ff2ee6e497a94f349e3171893ad"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.5.0/exc-darwin-amd64.tar.gz"
      sha256 "e7d078b57ee20af138aa89b35afe712204032d06ca1d0545676adeae33303b0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.5.0/exc-linux-arm64.tar.gz"
      sha256 "9827fd1fd37b4323e0b2368017900747807de9c7383a0594169fe095de802d64"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.5.0/exc-linux-amd64.tar.gz"
      sha256 "81d0a34832890ef353f8be80bc8f860728c931929cb13520d3790f2a6f4004d7"
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
