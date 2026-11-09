cask "overseer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.34.1"

  on_arm do
    sha256 "c03d35389c0d8dcac281bac0694a338d090affd4e7096627d7b5fa01439863e4"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "0ac7ffdee5b642c0c64c90063dad8679e10262cf29f912d27c3333ff78e3f198"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_x64.dmg"
  end

  name "Overseer"
  desc "Desktop client for Overseer agent sessions"
  homepage "https://github.com/basilelt/overseer"

  livecheck do
    url :url
    strategy :github_latest
  end

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
