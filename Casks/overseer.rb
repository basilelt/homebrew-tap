cask "overseer" do
  version "0.26.8"

  on_arm do
    sha256 "cf091a30d72bbe9b6c2d8f60944c2f42610b86519cef166dbbf032787e007882"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.8/Overseer_0.26.8_aarch64.dmg"
  end
  on_intel do
    sha256 "7046b7db70d0ae4b1ff24b0a2c040a28825dfe1e8de1c16070cb0ee9d612ae42"
    url "https://github.com/basilelt/overseer/releases/download/v0.26.8/Overseer_0.26.8_x64.dmg"
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
