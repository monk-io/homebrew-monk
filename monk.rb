class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.4.tar.gz"
  sha256 "3f158ba918992ded0de719f55b05845e3a3d1b5115dd2b46765135351fc320a1"
  version "3.1.4"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
