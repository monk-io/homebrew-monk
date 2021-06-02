class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.25.tar.gz"
  sha256 "295bac7524a48fb75c0f9be707759c247bf5de81cf6ad33bde75a94af48cb3d3"
  version "3.0.25"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
