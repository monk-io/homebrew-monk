class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.8.tar.gz"
  sha256 "1266d272eeb23fef36fbf6e296c6b7ae76248cfc1dc81a72672f6d471571cc9d"
  version "3.1.8"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
