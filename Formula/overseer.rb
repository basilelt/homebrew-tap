class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.13/overseer-0.26.13-aarch64-apple-darwin"
      sha256 "f06901083671f32df2621dbac0b087dad2d68b97558353bccce1aec39baacfcf"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.13/overseer-0.26.13-x86_64-apple-darwin"
      sha256 "2b4ea8b65fd2f8c98182fd8bd07437e4efd759cccb4bf3f1f0ac8a20b2128a4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.13/overseer-0.26.13-aarch64-unknown-linux-musl"
      sha256 "97c7158e0edeebec76c3ca581a22769e2b623eaf64054d8ca441b4228efbc473"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.13/overseer-0.26.13-x86_64-unknown-linux-musl"
      sha256 "a69842d4d98e1d24c78535693d984efd0f9594ed370d24642623a3610428af97"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
