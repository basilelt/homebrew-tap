class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.2/overseer-0.29.2-aarch64-apple-darwin"
      sha256 "df44e5bad58e5fc2f23fc456f6ccaf53e17a0bb1988014d544582298a43e706c"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.2/overseer-0.29.2-x86_64-apple-darwin"
      sha256 "f09577ba9b7b42a749499af47a6163569d55809589f14ebfde4058056acd926c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.2/overseer-0.29.2-aarch64-unknown-linux-musl"
      sha256 "5005b58a2aeced264543aa782ac0fe5b1963168dac5aa11a373c9ade42b613ca"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.2/overseer-0.29.2-x86_64-unknown-linux-musl"
      sha256 "3b7937fd705c18d4183b66bf24d3e9c124c0834122770da768d5cc3f38a0bede"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
