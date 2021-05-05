class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.19.tar.gz"
  sha256 "584acc3432d1f770b3d7e7e8ad13f3db2e79d524c587dd658a51887b36765e2c"
  version "3.0.19"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
