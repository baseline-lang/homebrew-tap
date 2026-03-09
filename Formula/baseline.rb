class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/baseline-lang/baseline"
  license "MIT"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/baseline-lang/baseline/releases/download/v#{version}/blc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bfae5f67652af6a89fb9827f2c346aa1a4b005c7cbca351a71de8fa07dfe7f17"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
