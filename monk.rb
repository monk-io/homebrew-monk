class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.18.tar.gz"
  sha256 "e6fa161b96d1687f5e21e919f819e87685ecec32dae473231719cc713b770341"
  version "3.0.18"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
