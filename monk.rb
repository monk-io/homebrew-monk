class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.12.tar.gz"
  sha256 "1326cdbbe851ee7d411106b01a67a4dad80fc39b99e0b623e3381f064dc2e098"
  version "3.0.12"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
