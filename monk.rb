class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.3.13.tar.gz"
  sha256 "9e418ef862ae1e4c9ea624a89217076d9ac5a9a703fed2f8d43241ebc5b8a718"
  version "2.3.13"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
