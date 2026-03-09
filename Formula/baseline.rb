class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/baseline-lang/baseline"
  license "MIT"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/baseline-lang/baseline/releases/download/v#{version}/blc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c9625a8b9644b502bd916bb91e65cd125b761d2076e210f09de6c5fbad95212d"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
