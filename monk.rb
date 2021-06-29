class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.3.tar.gz"
  sha256 "7f258f8a240182a79abe0be6a4e2ace038da550abf40210f30c61c8e52b47721"
  version "3.1.3"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
