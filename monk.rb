class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.6.tar.gz"
  sha256 "d00ef479e84d2f4e74822ee2550ad17d0f06985859ea3c985f356b7983f76b7a"
  version "3.1.6"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
