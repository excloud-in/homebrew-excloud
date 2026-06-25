class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.1/exc-darwin-arm64.tar.gz"
      sha256 "adc0643c52c1150abf188fc4667b4a365cac26fcf5d43efb22c1c22ecd80b004"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.1/exc-darwin-amd64.tar.gz"
      sha256 "d6787d6555cc3a170209bd7831bcb255461d8bf8709bcdb66338b2e858976d22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.1/exc-linux-arm64.tar.gz"
      sha256 "7f76d02d661f8e796ccf49b827b1a43e0e00e73fcabf5d22c7a365ef0d0aa2ba"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.9.1/exc-linux-amd64.tar.gz"
      sha256 "f513eb9a0952bb722a34326cca5c3c13334e78767fffe2deeb839058e04d0cae"
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
