class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.2.tgz"
  sha256 "8269d1d63b6b2aebf0be1078c1f102c6ff850c63f8804fecac80979bf3b18a69"
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
