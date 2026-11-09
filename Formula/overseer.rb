class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.35.0/overseer-0.35.0-aarch64-apple-darwin"
      sha256 "5ee5675ca0292a73ec33efd456ebdc8708c53fb070a9e67919fe7d42eb5699d7"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.35.0/overseer-0.35.0-x86_64-apple-darwin"
      sha256 "f54b3ca28ac975e9ff05d1d614cc830bd21c5813bced1e6bfc240a3e5ec5c23e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.35.0/overseer-0.35.0-aarch64-unknown-linux-musl"
      sha256 "391769ee16376bd055c9eb59ff06a24522606ee0843ff90e0a07f107445b9e49"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.35.0/overseer-0.35.0-x86_64-unknown-linux-musl"
      sha256 "cb95adb901d0c62d5db491bfe62f74d65aa61b291cbeeb777d2ac2cad0450ded"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
