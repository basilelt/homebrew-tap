class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.10/overseer-0.26.10-aarch64-apple-darwin"
      sha256 "f9600114d2f5bf8fb3ad31ad8d2156d5ee3b35b453c040d8ffc69c26062d6915"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.10/overseer-0.26.10-x86_64-apple-darwin"
      sha256 "0cb14deb01210fd595d0b932af33e2b921bacdbdbac3d726c84ef4b0ae079556"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.10/overseer-0.26.10-aarch64-unknown-linux-musl"
      sha256 "4970c511a9738b7155391705983db205a575ffbc0157b5aae423aa6a0233a297"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.10/overseer-0.26.10-x86_64-unknown-linux-musl"
      sha256 "ff2da31e772bcba168fe117867d913bdb0ed626d20fdb539fd1b4b5e8bdd5a0f"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
