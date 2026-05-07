class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.5.tgz"
  sha256 "ec4f79498ec8b21e81a427dee34226b8a05d206205e7809c2127e9156525657d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--omit=dev", "--no-save", "--ignore-scripts"
    end
    bin.install_symlink libexec/"bin/ash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ash --version")
  end
end
