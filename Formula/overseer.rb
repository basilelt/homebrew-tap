class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.2/overseer-0.37.2-aarch64-apple-darwin"
      sha256 "48fe65bcb16d2d292962664903b7d0ffda241015ba4faeb593e4016acc07d5bb"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.2/overseer-0.37.2-x86_64-apple-darwin"
      sha256 "e9ac8c54583c88f3bb4ebc76b1e62bca2a38f142979eaa218cb0feb08b6e6290"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.2/overseer-0.37.2-aarch64-unknown-linux-musl"
      sha256 "1ce0a7143b40073912a214e62b13a808288eb8f7411c225162f9a3c914635f15"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.2/overseer-0.37.2-x86_64-unknown-linux-musl"
      sha256 "159f4d6e4f2a834b2e6ce4d96e10b767033d9fd387b93ba838f732f4f50220c3"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
