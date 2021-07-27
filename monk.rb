class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.7.tar.gz"
  sha256 "744a2364fbf07106a8603a481d106726f9dc7127a8b82080ac7a0c6c46cb9665"
  version "3.1.7"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
