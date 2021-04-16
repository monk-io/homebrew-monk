class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.10.tar.gz"
  sha256 "115281de4a831acce937697d77f4474a29ef5474898928947460963e81499839"
  version "3.0.10"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
