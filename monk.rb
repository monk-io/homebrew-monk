class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.15.tar.gz"
  sha256 "8926b6eaba43b6b91aa0fcdb48b1660d4f11d4670ab77a949e6dbe26700ce7cf"
  version "3.0.15"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
