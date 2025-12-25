class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.7.tar.gz"
  sha256_x64 = "f1931af2e5a200f000f52c853271aa2438cba2d4701ece99e5ed88b563efb2c7"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.7.tar.gz"
  sha256_arm64 = "1b361b82b40e2c8b437b1ef5f65a03b20098418aef5def06cfb30090fe4ae44e"

  if Hardware::CPU.intel?
    sha256 sha256_x64
    url url_x64
  else
    sha256 sha256_arm64
    url url_arm64
  end

  depends_on "podman" => :recommended

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end

  def caveats; <<~EOS
    Initialize the monk machine with monk daemon inside
      monk machine init

    Upgrade monk daemon inside the monk machine to the latest version
      monk machine upgrade
    EOS
  end
end
