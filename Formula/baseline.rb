class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/manifestdocs/baseline"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/baseline/releases/download/v#{version}/blc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "514ff36b7b83b5e17355faa3b6947da8c0d334c16d899ebaa4fd86da6e34e012"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
