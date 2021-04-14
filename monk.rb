class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.8.tar.gz"
  sha256 "211303934c0259c1d9e8a365fd08fc80831e259650bf07a4f8fd5d115e51db7d"
  version "3.0.8"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
