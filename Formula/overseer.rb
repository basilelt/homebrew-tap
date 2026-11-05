class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.1/overseer-0.27.1-aarch64-apple-darwin"
      sha256 "ebde3f13a8080e9abb12aa9e7a7e61260f16d97340cf6ca58c52079a805bde5f"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.1/overseer-0.27.1-x86_64-apple-darwin"
      sha256 "3d17363b8f6518f6776076b0fd7aadc45d6b866ce936385a5f6f67f827b27e29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.1/overseer-0.27.1-aarch64-unknown-linux-musl"
      sha256 "08c206abe45955f2efa8698f17ac5eaa99bc846a5fbf0df88c1a29cc79f49b4e"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.1/overseer-0.27.1-x86_64-unknown-linux-musl"
      sha256 "82bea4272e5081b8c25461a8a7f7825094d5952f539aab8f118baa184aa17466"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
