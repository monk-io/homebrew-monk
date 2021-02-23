class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.5.9.tar.gz"
  sha256 "f4482e494ccca4fc5d66b8882af25c6aa5ac2d5091404cc67175100811cd3386"
  version "2.5.9"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
