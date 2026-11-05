class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.0/overseer-0.27.0-aarch64-apple-darwin"
      sha256 "0b37edc85f5460309b57c9cd864c7368ae1057bd5bbd968656bd4d1393451338"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.0/overseer-0.27.0-x86_64-apple-darwin"
      sha256 "0a0fc86d95aba2c27e1895f9c0d548b9671940188b4a7fb9a2191a8197aa2f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.0/overseer-0.27.0-aarch64-unknown-linux-musl"
      sha256 "68f6502dffd53616d187f0c3b7e11f0941b824b9572290015aefe11f5e3e7d1e"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.27.0/overseer-0.27.0-x86_64-unknown-linux-musl"
      sha256 "7f519606a2ea4180381f20953420ecba19e322890f15705ae04bcced36515d6c"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
