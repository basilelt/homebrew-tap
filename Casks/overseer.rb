cask "overseer" do
  version "0.26.6"
  sha256 "61bc4fd5e9bbffac012c73b803aa7fbc0ca41d372ba5db6da312c54a1ccaba14"

  url "https://github.com/basilelt/overseer/releases/download/v0.26.6/Overseer_0.26.6_aarch64.dmg"
  name "Overseer"
  desc "Desktop client for Overseer agent sessions"
  homepage "https://github.com/basilelt/overseer"

  depends_on :macos
  depends_on arch: :arm64

  app "Overseer.app"

  zap trash: [
    "~/Library/Application Support/io.github.basilelt.overseer",
    "~/Library/Caches/io.github.basilelt.overseer",
    "~/Library/Preferences/io.github.basilelt.overseer.plist",
    "~/Library/Saved Application State/io.github.basilelt.overseer.savedState",
    "~/Library/WebKit/io.github.basilelt.overseer",
  ]
end
