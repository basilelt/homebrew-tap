class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.1/overseer-0.32.1-aarch64-apple-darwin"
      sha256 "46748da58b170df2c4945925207d34677f6d80c4350b890a73f6692c181e42bb"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.1/overseer-0.32.1-x86_64-apple-darwin"
      sha256 "37998ae8f34055e19a27273390f2f740acce7077663dd5dd9cd705d273e62d0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.1/overseer-0.32.1-aarch64-unknown-linux-musl"
      sha256 "d5ccf0fcc199de7f226fe657ddf2226d8e563de9e15875db72be0284fc6e13ee"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.32.1/overseer-0.32.1-x86_64-unknown-linux-musl"
      sha256 "04bd7196e1869eebbae93b0bb42525abae7417ccd8f24e5ac1be9479a15b84db"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
