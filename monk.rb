class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.5.7.tar.gz"
  sha256 "2d70785904b30bd22e3252525b527ab4ac70167f294e00adc06d5bd359a9d613"
  version "2.5.7"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
