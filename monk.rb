class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.24.tar.gz"
  sha256 "f0e13ef656f6c873317fdc554119521eefa16bc67353ff48e159998cdfb5a655"
  version "3.0.24"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
