class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.28.0/overseer-0.28.0-aarch64-apple-darwin"
      sha256 "2b5597f84e8d52db14f678b66001698e8e897f968ff5497fd4a57a4587d63617"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.28.0/overseer-0.28.0-x86_64-apple-darwin"
      sha256 "c1c836a528fce1b6aa2ad7810213bd9b69ae460f9413b53b1ee282bab1d5c2e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.28.0/overseer-0.28.0-aarch64-unknown-linux-musl"
      sha256 "62b22145cd12d2d24a1dec2f1b09f6b5f30bcdef6ec1042bae5a96f54305e7bf"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.28.0/overseer-0.28.0-x86_64-unknown-linux-musl"
      sha256 "37b508b974f1e5dc92b353ac77801fc32940b358ce6c9ef60efd661f284cc4c3"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
