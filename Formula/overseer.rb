class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"
  version "0.26.7"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.7/overseer-0.26.7-aarch64-apple-darwin"
      sha256 "43a0150f7b83276c393ea6e287be0345dc431425f12761dc8cfa3cf76df07761"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.7/overseer-0.26.7-x86_64-apple-darwin"
      sha256 "7e1338ca7423ffa6dd7ae24f0b4aa286f9bb9ece3f2da4332c8bbe6080808271"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.7/overseer-0.26.7-aarch64-unknown-linux-musl"
      sha256 "acdc82481a3dd91f79d82647a6e7f1167db79e380d4bcb7c0288681739413559"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.7/overseer-0.26.7-x86_64-unknown-linux-musl"
      sha256 "118ebae4570ea3c2ef53f57d997a83c39a83527dfa669c0015c9dce42bafe8d7"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
