class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.11/overseer-0.26.11-aarch64-apple-darwin"
      sha256 "d0a8e5390e2a3b00dd215b178e80eb53994ebe4c37ddd52b9e897770342df25d"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.11/overseer-0.26.11-x86_64-apple-darwin"
      sha256 "a46163c3345837b4f3d92519f2827a8de9fe3185d048f0157fa2db1dd56b7825"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.11/overseer-0.26.11-aarch64-unknown-linux-musl"
      sha256 "3e898cdd5e3cca1063e08bdb791b187f5b2133e38edfdc047d61820e22fa1c18"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.11/overseer-0.26.11-x86_64-unknown-linux-musl"
      sha256 "6cddea8e53ad5a1cd9344f3096bb1458e6ee8286fbd20a3f72fb33bf45e3678f"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
