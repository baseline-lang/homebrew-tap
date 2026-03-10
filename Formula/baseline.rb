class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/baseline-lang/baseline"
  license "MIT"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/baseline-lang/baseline/releases/download/v#{version}/blc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "61247e54e3a6aaed96b64308903972346b2a78b7735155c87787517db62468e5"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
