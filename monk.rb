class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.5.tar.gz"
  sha256 "9c600ca0116b8c12de1e804b1c77c6a04e3898354ab7d79a921f7361b40eae4c"
  version "3.1.5"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
