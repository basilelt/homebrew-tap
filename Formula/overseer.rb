class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.30.0/overseer-0.30.0-aarch64-apple-darwin"
      sha256 "e49f7db09b1f73b7d2aaf221b99f32a24055f15f349ca7efaf82bd8ae3701d28"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.30.0/overseer-0.30.0-x86_64-apple-darwin"
      sha256 "60ff6410c46c03ccc962ea8cd65733742caa2759cd25bc4cb2b8f3f5c1ce03c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.30.0/overseer-0.30.0-aarch64-unknown-linux-musl"
      sha256 "cb9ad6d210682d00f0680edd9242047bf28032ae4f7eeed1546bccb88f54db6b"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.30.0/overseer-0.30.0-x86_64-unknown-linux-musl"
      sha256 "82d95134049df7a3eb52ba6320976a52717099105bf13fc0442c316f029ddac0"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
