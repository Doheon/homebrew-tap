class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.7.tgz"
  sha256 "9a74bc728d27fd9499b0345f743ef57c2e34ef1c50cbfa2289c866a41bc3dc40"
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
