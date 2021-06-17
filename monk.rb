class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.0.tar.gz"
  sha256 "87b67b8afeb0877868151cda7a86b1d34f460859d7410e95f88277a4b827435e"
  version "3.1.0"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
