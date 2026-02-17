class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/manifestdocs/baseline"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/baseline/releases/download/v0.2.0/blc-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e79ec8e3b1fdab02ea13574eccf6cd9a6a598c93a87bc72618c5bd4712b407c"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
