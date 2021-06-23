class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.2.tar.gz"
  sha256 "eb1e9a9c985508f2d9df732e2402f8d3f88fbc5f6de041c917b3ed5e295d3851"
  version "3.1.2"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
