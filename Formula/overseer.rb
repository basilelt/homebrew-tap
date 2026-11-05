class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.14/overseer-0.26.14-aarch64-apple-darwin"
      sha256 "d198593f78a0cacb9a7937b2c7080e1ffda23e7c2cb1f7f7f65449a970e4ab98"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.14/overseer-0.26.14-x86_64-apple-darwin"
      sha256 "afe60d85896f37744e425d68669c967423e87f65003816aa2ef4db4c9b38fa82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.14/overseer-0.26.14-aarch64-unknown-linux-musl"
      sha256 "b9e49abd5a8aeeaac1771afd92cf229b85964f13902ac4e829426ad5a582ce35"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.14/overseer-0.26.14-x86_64-unknown-linux-musl"
      sha256 "b6947cbd40d221170d2dc4aa298b0e10c3cb4180ea7de99c3d636d336f8bda2e"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
