cask "overseer" do
  version "0.26.7"

  on_arm do
    sha256 "aaf1cb2b2e16364fbc1df89765be41d27a5302d4734bbfb38e683e8ceb5dfe66"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.7/Overseer_0.26.7_aarch64.dmg"
  end
  on_intel do
    sha256 "6ff8e41bc7edb24b55ee49e79b9029638dde8f42b46d70be8c29a424e5467296"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.7/Overseer_0.26.7_x64.dmg"
  end

  name "Overseer"
  desc "Desktop client for Overseer agent sessions"
  homepage "https://github.com/basilelt/overseer"

  depends_on :macos

  app "Overseer.app"

  zap trash: [
    "~/Library/Application Support/io.github.basilelt.overseer",
    "~/Library/Caches/io.github.basilelt.overseer",
    "~/Library/Preferences/io.github.basilelt.overseer.plist",
    "~/Library/Saved Application State/io.github.basilelt.overseer.savedState",
    "~/Library/WebKit/io.github.basilelt.overseer",
  ]
end
