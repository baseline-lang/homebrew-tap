class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.0.0/manifest-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "2945d36e2d294aa056077ed08b66295f185d44fb26a687d614b4cdc01ad5f443"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.0.0/manifest-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa83057f2c4875eaab23ec6a2c444e9b6cfc923a25382e934decf9d2b666690a"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.0.0/manifest-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ef2d5058769abb9c0bdd4725304fdb22533150d3f5e3896d6f90df5803f291a3"
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
