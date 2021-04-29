class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.16.tar.gz"
  sha256 "1b0add5514c2ff3d764b1056b2ddb69d0f1b67733111e05e283b060aeec58e42"
  version "3.0.16"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
