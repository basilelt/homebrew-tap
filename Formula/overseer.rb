class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.36.0/overseer-0.36.0-aarch64-apple-darwin"
      sha256 "3e9381e0deba365ad071c19803d54364486ae4a4e7302fe26fa809b04da9c206"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.36.0/overseer-0.36.0-x86_64-apple-darwin"
      sha256 "4c7d25a0cc83af7140c27467a007090152eb2260924e408b48cf085c8f38da88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.36.0/overseer-0.36.0-aarch64-unknown-linux-musl"
      sha256 "f4aac16a9f9382680b5e55811896141d29769c48d7aac1e86e675796dbc73c07"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.36.0/overseer-0.36.0-x86_64-unknown-linux-musl"
      sha256 "d43f395b363e1932f6df02e59d0eb0c7f7fce959e996143c49282dcb520118c7"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
