class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.31.0/overseer-0.31.0-aarch64-apple-darwin"
      sha256 "b6ac19438565efb2991dc88d8c20450602890c5ebfc27fb7a5aac053b85b5dd6"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.31.0/overseer-0.31.0-x86_64-apple-darwin"
      sha256 "9ced00413140ccbdf4a7e322b76ef7376a16e6145d1acbcbf4db41d3387cb992"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.31.0/overseer-0.31.0-aarch64-unknown-linux-musl"
      sha256 "5367827b4f2846a9c38c0b0f6b4db46f798b8b402e7de8382962af721d34c353"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.31.0/overseer-0.31.0-x86_64-unknown-linux-musl"
      sha256 "1c99aadce31815f093c98e22c3e3780b3e4ea01e5b2e139c48ebf3600f9f1d7e"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
