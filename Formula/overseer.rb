class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.1/overseer-0.29.1-aarch64-apple-darwin"
      sha256 "87825e5cdb210948762b678c328d621a2c8e8fd97b22e7f4d735a4a2bb9751bb"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.1/overseer-0.29.1-x86_64-apple-darwin"
      sha256 "9671bd966e7ec093dc311a6fb47ccc69346894275f41cdd1870abdc80e23d421"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.1/overseer-0.29.1-aarch64-unknown-linux-musl"
      sha256 "839c5b1d6ab4d593fc9a84817af89c16c2e3993e055db42efe0462e8bea4569d"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.1/overseer-0.29.1-x86_64-unknown-linux-musl"
      sha256 "8d9ef8c553c2823f590a89c086253977227847c6c4a2b7f7e90e545ec2698a18"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
