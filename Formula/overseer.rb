class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.17/overseer-0.26.17-aarch64-apple-darwin"
      sha256 "dea5c5e14ae961bec889da21fbfd2927c1fb40e2d11f06e9aa79f564d8744fa0"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.17/overseer-0.26.17-x86_64-apple-darwin"
      sha256 "a4ceeb546f4f9878c24ef4d1dfd98e4f34cccef6caab1f9206c8bb5df9da037e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.17/overseer-0.26.17-aarch64-unknown-linux-musl"
      sha256 "58d77307f77a794457ee5eacebbdf6a38aea587517588bf626bd4e5de9b6594a"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.17/overseer-0.26.17-x86_64-unknown-linux-musl"
      sha256 "e29462b24993c7c0a94a95077c013c397c9eea76ae6eaa644d3755ba5c03fd66"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
