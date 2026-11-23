cask "overseer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.39.0"

  on_arm do
    sha256 "8804c71fad8f67a03e109c5220c9fda30714f9d548bf825a4e32011cb2eb9bfa"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "b3d8ba34e9a025900ad4407e70eec08bd0759a78e3a635732e0253869559e5f6"

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
