class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.19/overseer-0.26.19-aarch64-apple-darwin"
      sha256 "5c4952e4a29d90ce13492c615205a1fad76df9994fb5f90b1de17eb331a0fa96"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.19/overseer-0.26.19-x86_64-apple-darwin"
      sha256 "81b27f08b4023d857b478cbbe777296b69aa03f4c439795c4fa0f81421b444d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.19/overseer-0.26.19-aarch64-unknown-linux-musl"
      sha256 "355061c04ee1ebb7c8864b36788f0de2e4e4c8c7dc30c5131bfe0c37ac49901b"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.19/overseer-0.26.19-x86_64-unknown-linux-musl"
      sha256 "1e01c503a0ad69711293044cb0d02ee23e76cdce5194aceb78b56b042aa9c38a"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
