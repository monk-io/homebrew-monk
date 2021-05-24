class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.22.tar.gz"
  sha256 "c4b151e78cc91ef73bbd0f2bf66a1b2e3fbe5d135f5ae3a030968c9352bf0511"
  version "3.0.22"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
