class Overseer < Formula
  desc "Daemon and CLI that supervise coding agent sessions"
  homepage "https://github.com/basilelt/overseer"

  on_macos do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.1/overseer-0.33.1-aarch64-apple-darwin"
      sha256 "fe0f91eab157c148e787b1e5114cfe4ffcb570b3bd9997b3bdfcd7e0c3a01cf1"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.1/overseer-0.33.1-x86_64-apple-darwin"
      sha256 "052395effa6a04eebf8403db768b3e2e1cc60861e87ae409857eacb864489d52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.1/overseer-0.33.1-aarch64-unknown-linux-musl"
      sha256 "470d75a7acf33fd9af914e8ad69e3225a55daec1a2c427041758bc98458deeb6"
    end
    on_intel do
      url "https://github.com/basilelt/overseer/releases/download/v0.33.1/overseer-0.33.1-x86_64-unknown-linux-musl"
      sha256 "b66ab4f613a51a88e2056329aa709ca709eb192212364f2bde91076ced618fa5"
    end
  end

  def install
    bin.install Dir["overseer-*"].first => "overseer"
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/overseer version --json")
  end
end
