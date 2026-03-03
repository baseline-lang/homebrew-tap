class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.3.0/manifest-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "a4fccbffce4fe133d298151c1576acb78278094709b8784050ea09d76f57a0eb"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.3.0/manifest-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "6a43dc5e53dde8df5a3f1242216dcff3569e73a5c54dfdd7539935e63ca7c3b0"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.3.0/manifest-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5e9fa9178619bf90565a410222875774c8c00d07b72092038f4b568111001794"
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
