class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.7.0.tar.gz"
  sha256 "94c4a3d995fcf95951287264727504b607b568004f943fe3745e49095e61562e"
  version "2.7.0"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
