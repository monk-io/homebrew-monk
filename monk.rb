class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.21.tar.gz"
  sha256 "c4d1d0c8662888dbe422420ab60163041c938edd5f0fab98dbb54357712e2d59"
  version "3.0.21"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
