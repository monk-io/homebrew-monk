class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.4.4.tar.gz"
  sha256 "dc8c22814dc79ca458ca5dfcf88433a20e5438e81dd6059408295af17bf0ef07"
  version "2.4.4"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
