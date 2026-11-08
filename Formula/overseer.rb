class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.0/overseer-0.33.0-aarch64-apple-darwin"
      sha256 "421c1c61c244fc06e3987770862a5b03e64ada8b120a1cdd6d11d62d1972305f"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.0/overseer-0.33.0-x86_64-apple-darwin"
      sha256 "4efad9924a8862823db17395ba437d9ed2d874726c35c50427e57f94369ed884"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.0/overseer-0.33.0-aarch64-unknown-linux-musl"
      sha256 "c3038d9342069f416e117a86ded0e31193d8375a61c474fae5f790fbd9e3ab3f"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.0/overseer-0.33.0-x86_64-unknown-linux-musl"
      sha256 "b4bf54d1199c2cbec2f43147c771b2dde2b4f67bd94d5fc02d86b4acb3da699c"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
