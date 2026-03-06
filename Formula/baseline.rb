class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/manifestdocs/baseline"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/baseline/releases/download/v#{version}/blc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6088595e3984e0033782fe0f19024204d66a9117be59c5d52fc02354a46fff00"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
