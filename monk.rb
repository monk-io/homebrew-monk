class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.14.tar.gz"
  sha256 "e2d2bcd33caff224150b608e8bf54b69678fbcd0a5110004bfc2093b98393f8a"
  version "3.0.14"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
