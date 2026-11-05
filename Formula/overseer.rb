class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.12/overseer-0.26.12-aarch64-apple-darwin"
      sha256 "fba0c795ddac05e70af5ef1aec96b676ef53b594cb1590b466f7e51d143b89d6"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.12/overseer-0.26.12-x86_64-apple-darwin"
      sha256 "718069018243dc4b29b2d34c5f11a217d15e2bef4e2b9bf7dd3af051d3721530"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.12/overseer-0.26.12-aarch64-unknown-linux-musl"
      sha256 "45714794026fc74f228cb8ed450a2d9d589a2cf43465e272cc1ca635ff9531d4"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.12/overseer-0.26.12-x86_64-unknown-linux-musl"
      sha256 "b6140baf0a73b92f75232cc8556937e9a7fc64e13de19fd260253a239d6e40ad"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
