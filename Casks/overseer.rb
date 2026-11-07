cask "overseer" do
  version "0.30.0"

  on_arm do
    sha256 "e72af95c77508d482c25b5cabd5b1255e0fb1d519c7b7bebc9e077ec98144960"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "308ebe89451a3e3e292f7adea740056115eb44a67c0f96bac870729bbe412d13"

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

  zap trash: [
    "~/Library/Application Support/io.github.basilelt.overseer",
    "~/Library/Caches/io.github.basilelt.overseer",
    "~/Library/Preferences/io.github.basilelt.overseer.plist",
    "~/Library/Saved Application State/io.github.basilelt.overseer.savedState",
    "~/Library/WebKit/io.github.basilelt.overseer",
  ]
end
