class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.1.tgz"
  sha256 "f0888f884fe4154054f5e46b8cec6cb5f49edec142d29958da46b640c24d6fb0"
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
