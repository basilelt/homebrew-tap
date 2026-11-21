cask "overseer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.38.0"

  on_arm do
    sha256 "68393ca587dddf314f6a2d173445973dcf4c2f2080d4da58eb3be340d8b7e918"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "4588fc3622836ae3ad9ffb82557be81e6542cd054e84573b97b510270d3f2824"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_x64.dmg"
  end

  name "Overseer"
  desc "Desktop client for Overseer agent sessions"
  homepage "https://github.com/basilelt/overseer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Overseer.app"

  zap launchctl: "dev.overseer.daemon",
      script:    {
        executable:   "#{appdir}/Overseer.app/Contents/Resources/server/darwin-#{arch}/overseer",
        args:         ["uninstall", "--apply"],
        must_succeed: false,
      },
      trash:     [
        "~/.overseer",
        "~/Library/Application Support/io.github.basilelt.overseer",
        "~/Library/Application Support/overseer",
        "~/Library/Caches/io.github.basilelt.overseer",
        "~/Library/LaunchAgents/dev.overseer.daemon.plist",
        "~/Library/Logs/io.github.basilelt.overseer",
        "~/Library/Preferences/io.github.basilelt.overseer.plist",
        "~/Library/Saved Application State/io.github.basilelt.overseer.savedState",
        "~/Library/WebKit/io.github.basilelt.overseer",
      ]
end
