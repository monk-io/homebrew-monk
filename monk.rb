class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.23.tar.gz"
  sha256 "773f24d4b9b45c93858108868c8f4e4f0163e27b74e53dca56762f2bd2f00669"
  version "3.0.23"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
