cask "overseer" do
  version "0.29.2"

  on_arm do
    sha256 "72ea1c4b9c1125cd0d1bf93a380e8925b3c6f65b59481c1d81b584294ec2ef92"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "d454aa31966cd1fa6a8f87cf9f35ca74a1e4d82498f0084aaba4daafccedb9d1"

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
