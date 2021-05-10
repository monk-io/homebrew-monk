class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.20.tar.gz"
  sha256 "543b72352f8857edc120a14a3caf35ad5da3ad61c7f8d3e85ea4f59ee42d0f56"
  version "3.0.20"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
