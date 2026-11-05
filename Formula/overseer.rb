class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"
  version "0.26.9"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.9/overseer-0.26.9-aarch64-apple-darwin"
      sha256 "bc868e322e5ef11de1366037568dfd1436e59ced9d29191bf518f81a30288c42"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.9/overseer-0.26.9-x86_64-apple-darwin"
      sha256 "5c025c837bde84ea886a20ad03fada899ded61f6faae92385dcaf0e1267b640b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.9/overseer-0.26.9-aarch64-unknown-linux-musl"
      sha256 "6358a8d1253fd50eb668cd6d2505246a7d6787b2eda2e346041d2d49724dbaa3"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.9/overseer-0.26.9-x86_64-unknown-linux-musl"
      sha256 "621ae2298d0e950892c6f43dd5d1eb9bb8182985f44579e559a14bc342fb7521"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
