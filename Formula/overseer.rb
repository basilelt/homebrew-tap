class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.15/overseer-0.26.15-aarch64-apple-darwin"
      sha256 "8f198f5699b4b7c62041db2281356fe61c492c1f96f2e7b172523c2f8d6c897a"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.15/overseer-0.26.15-x86_64-apple-darwin"
      sha256 "ac58e1a0fe87ae797c89b65c5dcf6fdeb76b8dbba8ad095ef4b6e919ce40eb45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.15/overseer-0.26.15-aarch64-unknown-linux-musl"
      sha256 "f081bc56f7986d24562e2331aba612111f514e8fabbc2f0c7f21970f9ddb7af1"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.15/overseer-0.26.15-x86_64-unknown-linux-musl"
      sha256 "d650447a66a7d804fc00128f8ca722fd30f4c55a2be469a7808cdc3da438ef96"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
