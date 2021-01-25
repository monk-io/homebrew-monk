class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.4.2.tar.gz"
  sha256 "16d53c22f55fa1eec038d82725eaf8b2560791f2d765e9f50ceb0c6a5e13825c"
  version "2.4.2"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
