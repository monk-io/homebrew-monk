class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.4.11.tar.gz"
  sha256 "7115d06ab5d95dc857627f4944f53755847b4232e602f69d18a663aeb747542a"
  version "2.4.11"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
