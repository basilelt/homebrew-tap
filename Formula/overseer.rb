class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"
  version "0.26.6"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.6/overseer-0.26.6-aarch64-apple-darwin"
      sha256 "d0b1d7b681371cd4265fefe72390d12532c78d1b8f704265d994a6b86ce4a317"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.6/overseer-0.26.6-x86_64-apple-darwin"
      sha256 "fe826081ce2078646254dcb8dc41cb53f68c99e20011f2ae987531e24bbb40f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.6/overseer-0.26.6-aarch64-unknown-linux-musl"
      sha256 "a0ecc4dfee31cf37cb8f5f1c64f527b4acb9554e151a63b11aca009fcaf3b866"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.26.6/overseer-0.26.6-x86_64-unknown-linux-musl"
      sha256 "3efc0e1d83e8fc4a8878dfc4f32e37335a6f656790a212a679fe9ab8bf755642"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
