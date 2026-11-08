class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.0/overseer-0.34.0-aarch64-apple-darwin"
      sha256 "76128d0d0b532a32a47721299e4266e133292e50a461f01f68f56552262a3874"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.0/overseer-0.34.0-x86_64-apple-darwin"
      sha256 "63a5b98cc9f333ffd8a4025b69cc1d982c9c398546b9216d9e91ab7c52d33e41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.0/overseer-0.34.0-aarch64-unknown-linux-musl"
      sha256 "570218bea1437e938a19f630978d31b0d95f4e6f275c50190fdf0540a96f2f57"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.0/overseer-0.34.0-x86_64-unknown-linux-musl"
      sha256 "7c377d935f258418dbec62cfd4a51943f6c6e545459ca03a3ee79863dc270472"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
