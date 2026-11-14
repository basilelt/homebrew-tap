class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.0/overseer-0.37.0-aarch64-apple-darwin"
      sha256 "4b49fa9bb631a1cbb842bd6b1bce6a1319371891b0788988b568f5bb6079d203"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.0/overseer-0.37.0-x86_64-apple-darwin"
      sha256 "5685b86bf4f8f78eed33df64052cae9b368a142b05ec04964e1df7f3cb413652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.0/overseer-0.37.0-aarch64-unknown-linux-musl"
      sha256 "1a432b7a0709e9f02c99eb69ad916f98f45f17f87a993715756c2672c43470f8"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.0/overseer-0.37.0-x86_64-unknown-linux-musl"
      sha256 "4e418b97b7c04d70195e73d2e34551eb4c358a71b55627a93f93b4cf283f2782"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
