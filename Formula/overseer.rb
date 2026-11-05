class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.8/overseer-0.26.8-aarch64-apple-darwin"
      sha256 "f4bd4bc71d71c45cf8a9af81c966d7ed184a5e31b2b8f32bca65a47b6a721732"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.8/overseer-0.26.8-x86_64-apple-darwin"
      sha256 "38267560ab103f727d6ce8fdd684eeab28c425b2f5e059f0e96d65d7551007be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.8/overseer-0.26.8-aarch64-unknown-linux-musl"
      sha256 "a74681d0a392823d29e1ff905c64e7e837557c42538adcca82e8f5879fb06bbb"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.8/overseer-0.26.8-x86_64-unknown-linux-musl"
      sha256 "179bf675e05317d02c7b521608ddde9679972fb3fbf90304d95fb7708b038fbe"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
