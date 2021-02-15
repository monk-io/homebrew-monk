class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.5.4.tar.gz"
  sha256 "0d58d059974fdd2383786f507002a953f2840c59c957b63c065b3562f6930330"
  version "2.5.4"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
