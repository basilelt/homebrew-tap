class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.0/overseer-0.32.0-aarch64-apple-darwin"
      sha256 "9b8a537ba03b7095815c231bfff82b911571d1f7ac5d565d30c384709b2f6cb8"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.0/overseer-0.32.0-x86_64-apple-darwin"
      sha256 "d0943d4534ec1e27d0a0c7a06770fa39b46a991b6219628c02ff463bdac94d8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.0/overseer-0.32.0-aarch64-unknown-linux-musl"
      sha256 "42dc81b4d5194c1a4b75143404f340cc156a94bca3d8e17784bda0817bf441a4"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.0/overseer-0.32.0-x86_64-unknown-linux-musl"
      sha256 "f44764309d18ecb6279e3e0fad4c28d29b5ca3dfdd50ecaa48e8d7f2874225a5"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
