cask "overseer" do
  version "0.26.9"

  on_arm do
    sha256 "6fe50eea8f379fb6a012a930f8c1ff65b416c901ad0f319b279103ecafbf2bed"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.9/Overseer_0.26.9_aarch64.dmg"
  end
  on_intel do
    sha256 "fd102f6eacf600b61c967cf1fbb3285eb31750e64b3fb3591b3aea83c07de951"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.9/Overseer_0.26.9_x64.dmg"
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
