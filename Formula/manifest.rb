class Manifest < Formula
  desc "Living feature documentation for AI-driven development"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.2.0"

  depends_on "node@22"

  def install
    system "npm", "install", "-g", "--prefix", libexec,
           "@manifestdocs/app@#{version}", "@manifestdocs/pi@#{version}"
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  service do
    run [opt_bin/"manifest", "start"]
    keep_alive true
    working_dir var/"manifest"
    log_path var/"log/manifest.log"
    error_log_path var/"log/manifest.log"
  end

  def post_install
    (var/"manifest").mkpath
    (var/"log").mkpath
  end

  def caveats
    <<~EOS
      Manifest runs on port 4242.

      Start the service:
        brew services start manifest

      Open http://localhost:4242 in your browser.

      To integrate with Pi:
        manifest setup pi

      To integrate with Claude Code:
        manifest setup claude
    EOS
  end

  test do
    system bin/"manifest", "version"
  end
end
