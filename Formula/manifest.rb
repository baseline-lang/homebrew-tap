class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.1.0/manifest-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "224993b62467115342ab9b47d11e386e562b7232f0a498f05dbc101a2feb5df3"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.1.0/manifest-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "dc01ddbb027b8cf8224c59e2f541a7a50d22f9c590496f4784d9c48e380a6b8b"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.1.0/manifest-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c0e8d14eb7d595748e13fc843ec923ef545258632d93c8fddf43c724a0eee981"
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
