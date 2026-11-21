class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.38.0/overseer-0.38.0-aarch64-apple-darwin"
      sha256 "6df8e8ccbb4b3bbca665693f6b847bd5f00b30bbafe1fccc507977c9b06e0aaf"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.38.0/overseer-0.38.0-x86_64-apple-darwin"
      sha256 "7a5ca05ae6413840e8c81ae447e16a47c1db1c5834b85e0e21b29b975cbaabfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.38.0/overseer-0.38.0-aarch64-unknown-linux-musl"
      sha256 "d87987ae3d444de8c819f80235bb9874157483ca812ce99835071f33fa1f954c"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.38.0/overseer-0.38.0-x86_64-unknown-linux-musl"
      sha256 "f03690fe459301ce438e7651e03cb6db4606a5ba70dc39491ed8b0d36a0fb0dd"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
