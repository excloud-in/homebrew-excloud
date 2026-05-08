class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.2.0/exc-darwin-arm64.tar.gz"
      sha256 "04e0e696b9e1c93280faac75548569eb2095d09532f54287a98a623883837e12"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.2.0/exc-darwin-amd64.tar.gz"
      sha256 "701a07eedad5a906f3f927983a1e11bc2cf9fca7c685db409ccb907913edce8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v1.2.0/exc-linux-arm64.tar.gz"
      sha256 "440103ad7fe443de5d991b197f791d5319c5f146e5049f447a0f8fda99194fc4"
    else
      url "https://github.com/excloud-in/cli/releases/download/v1.2.0/exc-linux-amd64.tar.gz"
      sha256 "a0c44d1055aafcd476e1089809f1c57587bc55bf98a4e28fce5444be1e291d41"
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
