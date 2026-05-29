class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.7.0/exc-darwin-arm64.tar.gz"
      sha256 "befde94a6cb82c2b40e733ec87d6a5330891b8b8ff975ce6fd852f58f5fbdfcc"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.7.0/exc-darwin-amd64.tar.gz"
      sha256 "f47ba8ef802bf05cd85f02404c9d09929fd0fcb0307600db4363f1ab41d94099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-dev/cli/releases/download/v1.7.0/exc-linux-arm64.tar.gz"
      sha256 "817107352d8775c2873a558e2968f9502ad47ad94e7e8eebe57f378bae59515d"
    else
      url "https://github.com/excloud-dev/cli/releases/download/v1.7.0/exc-linux-amd64.tar.gz"
      sha256 "4f6d6136c36dd05777a0bcb573857493ba20a6e82da5c052e4e60f9ff14d838c"
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
