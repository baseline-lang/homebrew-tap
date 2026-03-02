class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.2.0/manifest-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9bc5797eca3c26d5f2bb169689199bfffa82083fd36fe460e2ae62176ac119cd"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v1.2.0/manifest-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "139d46517e153f499b92195efad9b6968d376079bb17bdfaa59ac9d6f3163dfb"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v1.2.0/manifest-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "05d4e936415f355b8921768a34629946dab98bb3b189ca20df4345c5ed8461fe"
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
