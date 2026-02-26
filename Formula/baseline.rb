class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/manifestdocs/baseline"
  license "MIT"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/baseline/releases/download/v#{version}/blc-darwin-arm64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/manifestdocs/baseline/releases/download/v#{version}/blc-darwin-x86_64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manifestdocs/baseline/releases/download/v#{version}/blc-linux-x86_64-v#{version}.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
