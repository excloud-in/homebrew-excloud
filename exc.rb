class Exc < Formula
  desc "CLI for interacting with ExCloud"
  homepage "https://github.com/excloud-in/cli"
  version "v20241123071318"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241123071318/exc-darwin-arm64.tar.gz"
      sha256 "6bbc7a842a3d621f96a6dc074c3961ada95394094a409293fdc7fea542bac93a"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241123071318/exc-darwin-amd64.tar.gz"
      sha256 "2313acb3fab6a9d52029420016a397665979414a830ff0abc8149765c80c3a8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/excloud-in/cli/releases/download/v20241123071318/exc-linux-arm64.tar.gz"
      sha256 "e9c4a6e87974be71da4e9ef3434737446bfeaa240fb0b6deaba72fed2a44db0c"
    else
      url "https://github.com/excloud-in/cli/releases/download/v20241123071318/exc-linux-amd64.tar.gz"
      sha256 "89d3271c7d6c12ca08813356def1658199971d5253c6a459b7cde74c6af9d4de"
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
