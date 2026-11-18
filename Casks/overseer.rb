cask "overseer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.37.2"

  on_arm do
    sha256 "929897991d2d52b19d8a29bf6412617eb3ee45d8b0bc0acbd2e1e4ace1f8cb15"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "be037faa9efc3bcecc9a2f6890d101332f0038d1458d68c0e85f2e0cbdd00b69"

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
