class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.9.tar.gz"
  sha256 "a4c8f8967f9a4b4ec720c533d3bba7bafbfaf0a1045a0be27c01d91b2149200d"
  version "3.1.9"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
