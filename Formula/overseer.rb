class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.39.0/overseer-0.39.0-aarch64-apple-darwin"
      sha256 "9c750d936e0d11472c9d221166dd1e74b8fee24ff18b603f2e56f71f5a86dd30"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.39.0/overseer-0.39.0-x86_64-apple-darwin"
      sha256 "6511998ce6fb7c4133a9f7068458163e6838225bfdb389cdf04d783ecabb4c54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.39.0/overseer-0.39.0-aarch64-unknown-linux-musl"
      sha256 "d939dee83cae1b84d77440ede212c6f6ffd49ad06087abfeb25da2c5d32af4d1"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.39.0/overseer-0.39.0-x86_64-unknown-linux-musl"
      sha256 "63daa58d6ffdde44fe11700224f74cebec7f59264bf54519d28d9593d751a30f"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
