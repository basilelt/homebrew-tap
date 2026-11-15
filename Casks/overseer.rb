cask "overseer" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.37.1"

  on_arm do
    sha256 "8dc477ebddf38c0a5ad0d321102dea24fe4fddeea946ae6cc5b8835147d2603a"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "fb0c57d21c9ce17e361737d5de69f9de0f783c18ab7ba385b36363306991bffc"

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
