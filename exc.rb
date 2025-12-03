class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.5/exc-darwin-arm64.tar.gz"
      sha256 "256916dc88dd222dd4f61459d9769efec88403db8c658d37eb2d333ee6aa5547"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.5/exc-darwin-amd64.tar.gz"
      sha256 "09f19e1da4c60ceca7978ece0982979868055a8b049a6f9f4be31fc61a7ce637"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.0.5/exc-linux-arm64.tar.gz"
      sha256 "be841787c5738a187b829ed6ed91290c763648edf2ab12fe545ce4cb6790e8f9"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.0.5/exc-linux-amd64.tar.gz"
      sha256 "130ff9650928afb6ecabba6ba4f55469715345beff3fca7f73d4fc5df93630ff"
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
