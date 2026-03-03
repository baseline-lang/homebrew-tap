class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.4.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.4.0/manifest-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb31a4fa9e205145a9b29c42abc520079f96ed8b8bb3d94a38a2e4f05ab37cfa"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.4.0/manifest-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "7524bf7bd8270e9bebc419f963ded4ddee61c81ed5ee4c32d187b3f9cbcd95b7"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.4.0/manifest-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7765c977c2c2be624c905fbef5cd1c0c66e960c74e0d119c8798cc1a52b8b7f6"
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
