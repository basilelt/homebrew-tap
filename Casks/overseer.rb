cask "overseer" do
  version "0.26.12"

  on_arm do
    sha256 "f4d2d702d9e2eddc52a2e9bfc2e378fc310882e6fc7aad739c2576dd4bff8a2d"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "d341f9ed9b257f0c65418d0d3922db40b6051f26db099ff0f42b6a710a858334"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_x64.dmg"
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
