cask "overseer" do
  version "0.27.0"

  on_arm do
    sha256 "0e743ad272eb05f5ece65af7c4d0cfe59d2fd2d3c580b88cb2c52cd5fdd1c267"

    url "https://github.com/basilelt/overseer/releases/download/v#{version}/Overseer_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "02a03b1a0e8987d7902963f4381d4d878db865526c8b4026bb24921d6902ce4d"

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
