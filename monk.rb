class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.4.1.tar.gz"
  sha256 "b758fa65f26a4da30da154715eb0bd134a51ee2333c26269796374c3bbd15329"
  version "2.4.1"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
