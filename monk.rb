class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.4.3.tar.gz"
  sha256 "f0f8630e944272e598ee2ddacb96e9752167583dc44170087273ce3795013b22"
  version "2.4.3"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
