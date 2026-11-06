class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.0/overseer-0.29.0-aarch64-apple-darwin"
      sha256 "b3d70138190ab5011295bfff21b1960a2ac3c4ec2eaa4d9449b71331c3db6929"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.0/overseer-0.29.0-x86_64-apple-darwin"
      sha256 "37a2ed701fdafdeea98b84a87f63301045a4d97d5009679528436da0a51d2a8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.0/overseer-0.29.0-aarch64-unknown-linux-musl"
      sha256 "9efdb69fb000e8c615b97e9884b53464932b20339a1fa48b9e0c85f9c4c4096b"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.29.0/overseer-0.29.0-x86_64-unknown-linux-musl"
      sha256 "1105bff5b33d4072d6156c3393562982147c1573559e5a04e3111d25a9680ffe"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
