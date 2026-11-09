class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.1/overseer-0.34.1-aarch64-apple-darwin"
      sha256 "88240d1bfe89ef94007fcb539a1297dbd0b6c85f6f1b163adcd90e052adfe173"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.1/overseer-0.34.1-x86_64-apple-darwin"
      sha256 "793feeb4801bf8fea98b6a59f7956fe70a7dcd91be0775ebaacd1051d4c6a507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.1/overseer-0.34.1-aarch64-unknown-linux-musl"
      sha256 "ca7ea1428fb8cdd0b3e6a3dd9df26ab1864540fb9374e4494389fd93cbc989f7"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.34.1/overseer-0.34.1-x86_64-unknown-linux-musl"
      sha256 "56e0301c5b97e0cef41f9b228b34089de1e98dd69ccd9274e6ba9a6b78796952"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
