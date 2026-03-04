class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.5.0/manifest-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "08086cff2a4524c9a9603c8d6318f4741a3fc1cbf954db9e4c5dbdb265374f88"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.5.0/manifest-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "0de5796024fff902dee3cddd579f72cb6149008d2af8e1d6d15ff77d12730a4a"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.5.0/manifest-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5d67e7959292b58e9861d00693e8ee3ff1d850bfe05f53d55f0aa4173214684"
  end

  def install
    bin.install "manifest"
  end

  service do
    run [opt_bin/"manifest", "serve"]
    keep_alive true
    working_dir var/"manifest"
    log_path var/"log/manifest.log"
    error_log_path var/"log/manifest.log"
  end

  def post_install
    (var/"manifest").mkpath
    (var/"log").mkpath
  end

  test do
    system "#{bin}/manifest", "--help"
  end
end
