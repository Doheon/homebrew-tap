class Ash < Formula
  desc "Distributed P2P AI coding agent network — share idle compute, earn credits"
  homepage "https://github.com/Doheon/agent-share"
  url "https://registry.npmjs.org/@doheon/ash/-/ash-0.1.0.tgz"
  sha256 "9ea9be1d1046e9cfe2c3fe4a318963e57609886a22da61b8df7a5ea15e8ba8c8"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false), "--ignore-scripts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ash --version")
  end
end
