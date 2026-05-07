class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.3.tgz"
  sha256 "4d7c3a4e80690b54c3374700cc1f0e17a66fd82505001c168575610f3ca5afcf"
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
