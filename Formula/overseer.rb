class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.16/overseer-0.26.16-aarch64-apple-darwin"
      sha256 "7df73b9737335aba5e5ed671262f2b98741b66088b756c4b914c39db88612986"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.16/overseer-0.26.16-x86_64-apple-darwin"
      sha256 "f7788fc3089c55f2962aa0c64c8763094fe79299db33fc74845a63ab83b7a31a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.16/overseer-0.26.16-aarch64-unknown-linux-musl"
      sha256 "8bf288f9c1157825d91847a951d6d857cbde21333af767147ef559c430e02ddd"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.16/overseer-0.26.16-x86_64-unknown-linux-musl"
      sha256 "562d61db7674a850e3d8a02046bb09c4e6c57f33fb492632f614b4d2ac8e503c"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
