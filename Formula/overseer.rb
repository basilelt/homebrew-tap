class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.1/overseer-0.37.1-aarch64-apple-darwin"
      sha256 "fc08f4f04b76026b0cf6563cf4e1913fcf9e5e2b94e47e3bd99373608b3fb7a9"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.1/overseer-0.37.1-x86_64-apple-darwin"
      sha256 "2569e0e3e3072486b20b2880a184e4ee22169c3550051e32fb55c7e717645f44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.1/overseer-0.37.1-aarch64-unknown-linux-musl"
      sha256 "41b85d609a26914f0b71e4bb80dd3636849fc642d888cc0bc7d64c53ba443219"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.37.1/overseer-0.37.1-x86_64-unknown-linux-musl"
      sha256 "6e63cc84541785e84f3acd55b031f8cd1a418a56cce740a4b883b312afabb339"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
