class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.18/overseer-0.26.18-aarch64-apple-darwin"
      sha256 "dd7a1f36bd213b0ac86760cf83cd850b0c82df365004559c54ee48aeb3c838e4"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.18/overseer-0.26.18-x86_64-apple-darwin"
      sha256 "b2ad23dcdab195b1a3e43db3ad0bce1db39077ced35594fb9973e78bc3e5ff96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.18/overseer-0.26.18-aarch64-unknown-linux-musl"
      sha256 "d648cb34c17386373f8fed44fd52309f47301f49e2030e1fc8e1d7b5a2ffa675"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.18/overseer-0.26.18-x86_64-unknown-linux-musl"
      sha256 "37215df82cdb3f0f2823160749e3df0f02e0e22074aac32d907edc40e1feedb1"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
