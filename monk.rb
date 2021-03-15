class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.6.6.tar.gz"
  sha256 "bbb184ce35d9752d249ea16f3821ddea033a325b6028874bda6ce0f6c4683b27"
  version "2.6.6"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
